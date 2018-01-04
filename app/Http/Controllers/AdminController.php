<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Carbon\Carbon;
use Illuminate\Http\Request;

class AdminController extends Controller
{
  public function getOrderHistory()
  {
    try {

      $result = Reservation::select('id', 'first_name', 'last_name', 'email', 'check_in', 'check_out', 'adults', 'children', 'amount', 'created_at', 'status')->paginate(30);

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
    $result = Reservation::where('id', $request->orderId)->with(['reservationDetails.roomType', 'reservationDetails.images'])->first();

    return response()->json($result);
  }

  public function getOrderHistorySummarize()
  {

    $summarize = [
      'today_guest' => 0,
      'today_booked' => 0
    ];

    $result = Reservation::all();

    foreach($result as $r) {
      $start = new Carbon($r->check_in, 'Asia/Jakarta');
      $end = new Carbon($r->check_out, 'Asia/Jakarta');
      if(Carbon::now()->between($start, $end)) {
        $summarize['today_guest'] += $r->adults + $r->children;
        $summarize['today_booked'] += 1;
      }
    }


    return response()->json($summarize);
  }
}
