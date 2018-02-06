<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Notifications\ReservationPaid;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Srmklive\PayPal\Services\ExpressCheckout;

class AdminController extends Controller
{
  public function getOrderHistory(Request $request)
  {
    $d = [];
    $asc = $request->ascending ? 'asc' : 'desc';

    try {

      if (isset($request->searchItem)) {
        $columns = ['id', 'first_name', 'last_name', 'email', 'check_in', 'check_out', 'adults', 'children', 'amount', 'created_at', 'status', 'session'];
        $query = Reservation::select('id', 'first_name', 'last_name', 'email', 'check_in', 'check_out', 'adults', 'children', 'amount', 'created_at', 'status', 'session', 'remarks', 'addition_note')
          ->where(function ($query) {
            $query->where('status', 'completed')
              ->orWhere('status', 'refunded');
          });

        foreach ($columns as $column) {
          $query->orWhere($column, 'LIKE', '%' . $request->searchItem . '%');
        }

        $result = $query->orderBy($request->orderBy, $asc)->skip($request->page * $request->limit)->paginate($request->limit);

      } else {
        $result = Reservation::select('id', 'first_name', 'last_name', 'email', 'check_in', 'check_out', 'adults', 'children', 'amount', 'created_at', 'status', 'session', 'remarks', 'addition_note')
          ->where(function ($query) {
            $query->where('status', 'completed')
              ->orWhere('status', 'refunded');
          })
          ->orderBy($request->orderBy, $asc)->skip($request->page * $request->limit)->paginate($request->limit);
      }

    } catch (\Exception $e) {
      $result = [
        'status' => false,
        'code' => $e->getCode(),
        'message' => $e->getMessage()
      ];

      return response()->json($result, 500);
    }

    return response()->json($result, 200);
  }

  public function postOrderHistory(Request $request)
  {
    $reservation = Reservation::where('session', $request->sessionId)
      ->with(['reservationDetails.roomType', 'reservationDetails.images']);

    if (!Auth::check()) {
      $reservation = $reservation->where(function ($query) {
        $query->where('status', 'completed')
          ->orWhere('status', 'refunded');
      })->exclude(['transaction_id', 'internal_note']);
    }

    $reservation = $reservation->first();

    foreach ($reservation->reservationDetails as $reservationDetail) {
      foreach (collect($reservationDetail->roomType)->keys() as $key) {
        $reservationDetail->$key = $reservationDetail->roomType->$key;
      }
    }

    if ($reservation) {
      if (Auth::check() && $reservation->status != 'refunded') {
        $checkIn = Carbon::parse($reservation->check_in);
        $now = Carbon::now();

        $dateDiff = $now->diffInDays($checkIn, false);

        if ($dateDiff >= 31) {
          $refundAmount = $reservation->amount * 0.75;
        } else if ($dateDiff >= 15) {
          $refundAmount = $reservation->amount * 0.5;
        } else {
          $refundAmount = 0;
        }
        $reservation->amount_canbe_refund = $refundAmount;
      }
      $result = [
        'status' => true,
        'message' => 'Reservation Found.',
        'reservationData' => $reservation
      ];
      return response()->json($result, 200);
    } else {
      return ErrorController::validationError('ReservationNotFound');
    }
  }

  public function getOrderHistorySummarize()
  {

    $summarize = [
      'today_guest' => 0,
      'today_booked' => 0
    ];

    $result = Reservation::all();

    foreach ($result as $r) {
      $start = new Carbon($r->check_in, 'Asia/Jakarta');
      $end = new Carbon($r->check_out, 'Asia/Jakarta');
      if (Carbon::now()->between($start, $end)) {
        $summarize['today_guest'] += $r->adults + $r->children;
        $summarize['today_booked'] += 1;
      }
    }


    return response()->json($summarize);
  }

  public function cancelWithoutRefundTransaction(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'sessionId' => 'required|exists:reservations,session'
    ]);

    if ($validator->fails()) {
      return ErrorController::validationError("CancelError");
    } else {


      $reservation = Reservation::where('session', $request->sessionId)
        ->where('status', "completed")
        ->first();

      if ($reservation) {

        $reservation->status = "cancelled";
        $reservation->status_time = Carbon::now();
        $reservation->save();

        $result = [
          'status' => true,
        ];
        return response()->json($result, 200);

      } else {
        $result = [
          'status' => false,
        ];
        return response()->json($result, 422);
      }
    }


  }


  public function refundTransaction(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'sessionId' => 'required|exists:reservations,session'
    ]);

    if ($validator->fails()) {
      return ErrorController::validationError("RefundError");
    } else {


      $reservation = Reservation::where('session', $request->sessionId)
        ->where('payment_method', 'paypal')
        ->where('status', "completed")
        ->first();

      $refund_status = true;
      if ($reservation) {
        $checkIn = Carbon::parse($reservation->check_in);
        $now = Carbon::now();

        $dateDiff = $now->diffInDays($checkIn, false);

        if ($dateDiff >= 31) {
          $message = "Refund 75%.";
          $refundAmount = $reservation->amount * 0.75;
        } else if ($dateDiff >= 15) {
          $message = "Refund 50%.";
          $refundAmount = $reservation->amount * 0.5;
        } else {
          $message = "Refund 0%.";
          $refundAmount = 0;
          $refund_status = false;
        }

        if ($refundAmount > 0) {
          $provider = new ExpressCheckout;
          $transaction = $provider->getExpressCheckoutDetails($reservation->transaction_id);

          $response = $provider->refundTransaction($transaction['TRANSACTIONID'], $refundAmount);

          if ($response['ACK'] == "Success") {
            $message = $message . " Refund Success, amount is " . $refundAmount . " MYR.";
            $reservation->status = "refunded";
            $reservation->refund_amount = $refundAmount;
            $reservation->refund_at = Carbon::now();
            $reservation->save();

            $reservation->total_rooms = count($reservation->reservationDetails);
            $reservation->total_nights = ReservationController::getTotalNight($reservation->check_in, $reservation->check_out);
            $reservation->notify(new ReservationPaid($reservation));
          } else {
            $result = [
              'status' => false,
              'message' => $response,
            ];
            return response()->json($result, 422);
          }
        } else {
          $message = $message . " No Refund";
        }

        $result = [
          'status' => true,
          'refund_status' => $refund_status,
          'message' => $message,
        ];
        return response()->json($result, 200);
      } else {
        $result = [
          'status' => false,
          'message' => "Already Refunded."
        ];
        return response()->json($result, 422);
      }
    }

  }

  public function saveInternalNote(Request $request)
  {
    $reservation = Reservation::where('session', $request->sessionId)->first();

    $reservation->internal_note = $request->internal_note;

    $reservation->save();

    $result = [
      'status' => true,
      'message' => 'Internal Notes is saved.'
    ];
    return response()->json($result, 200);
  }
}
