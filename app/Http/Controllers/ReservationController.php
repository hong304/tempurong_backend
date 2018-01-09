<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\ReservationDetails;
use App\Models\Room;
use App\Models\RoomType;
use App\Notifications\ReservationPaid;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;

class ReservationController extends Controller
{
	protected $mattressPrice = 18;
	protected $breakfastPrice = 12;
	
	public function getReservation()
	{
		$data = Reservation::with(['reservationDetails.roomType', 'reservationDetails.images'])
			->get();
		
		return response()->json($data);
	}
	
	public function postReservation(Request $request)
	{
		$clientInfoValidator = Validator::make($request->clientInfo, [
			'firstName' => 'required',
			'lastName' => 'required',
			'email' => 'required|email',
			'tnc' => 'required|boolean'
		]);
		if ($clientInfoValidator->fails() || $request->clientInfo['tnc'] != true) {
			return ErrorController::validationError("clientInfoError");
		} else {
			$orderValidator = Validator::make($request->order, [
				'adults' => 'required|integer|min:1',
				'checkIn' => 'required',
				'checkOut' => 'required',
				'roomObjects' => 'required'
			]);
			
			if ($orderValidator->fails() || !$this->validateOrder($request->order)) {
				return ErrorController::validationError("orderInfoError");
			} else {
				// if no error, put reservation details into DB
				$session_id = uniqid() . mt_rand(100, 999);
				DB::beginTransaction();
				try {
					$clientInfo = $request->clientInfo;
					$orderInfo = $request->order;
					
					// insert reservation
					$reservation = new Reservation();
					$reservation->session = $session_id;
					
					$reservation->first_name = $clientInfo['firstName'];
					$reservation->last_name = $clientInfo['lastName'];
					$reservation->email = $clientInfo['email'];
					
					$reservation->adults = $orderInfo['adults'];
					$reservation->children = $orderInfo['children'];
					$reservation->check_in = $orderInfo['checkIn'];
					$reservation->check_out = $orderInfo['checkOut'];
					
					$reservation->language = $request->lang;
					
					$reservation->remarks = $clientInfo['remarks'];
					$reservation->addition_note = $clientInfo['additionalNote'];
					
					$reservation->amount = $orderInfo['totalPrice'];
					$reservation->payment_method = "paypal";
					
					$reservation->status = "waiting_for_payment";
					
					$reservation->save();
					
					// insert reservation Details
					foreach ($orderInfo['roomObjects'] as $roomType) {
						$noOfRoom = (int)$roomType['noOfRoom'];
						if ($noOfRoom > 0) {
							$roomAvailable = $this->getAvailableRoomId($orderInfo['checkIn'], $orderInfo['checkOut'], $roomType['id']);
							$roomTypeDetails = RoomType::where('id', $roomType['id'])->first();
							$mattress = $roomType['mattress'];
							$breakfast = $roomType['breakfast'];
							$totalNight = $this->getTotalNight($orderInfo['checkIn'], $orderInfo['checkOut']);
							
							for ($i = 0; $i < $noOfRoom; $i++) {
								$reservationDetail = new ReservationDetails();
								
								$reservationDetail->reservation_id = $reservation->id;
								$reservationDetail->room_type_id = $roomType['id'];
								$reservationDetail->room_id = $roomAvailable[$i];
								
								$roomPrice = $roomTypeDetails->price;
								if ($breakfast > 0) {
									$roomPrice = $roomPrice + $this->breakfastPrice;
								}
								if ($mattress > 0) {
									$roomPrice = $roomPrice + $this->mattressPrice;
								}
								$reservationDetail->price = $roomPrice * $totalNight;
								$reservationDetail->capacity = ($mattress > 0) ? $roomTypeDetails->capacity + 1 : $roomTypeDetails->capacity;
								$reservationDetail->mattress = ($mattress > 0) ? 1 : 0;
								$reservationDetail->breakfast = ($breakfast > 0) ? 1 : 0;
								$mattress--;
								$breakfast--;
								
								$reservationDetail->status = $reservation->status;
								$reservationDetail->start_date = $orderInfo['checkIn'];
								$reservationDetail->end_date = $orderInfo['checkOut'];
								
								$reservationDetail->save();
							}
						}
					}
					
					
					DB::commit();
				} catch (\Exception $e) {
					DB::rollback();
					return ErrorController::internalError("InsertReservationError");
				}
			}
			
			return ErrorController::successMessage($session_id);
		}

//		return response()->json($request->all());
		
	}
	
	public function availableRooms()
	{
		
	}
	
	public function postCheckAvailableRooms(Request $request)
	{
		
		$room_type_ids = [1, 2, 3];
		$rooms_available = [];
		
		$checkInDate = $request->checkIn;
		$checkOutDate = $request->checkOut;
		try {
			foreach ($room_type_ids as $k => $room_type_id) {
				
				//reorder reservation in DB of this room type
				$this->reorderReservation($room_type_id);
				
				// select available room again
				// put available room value to array
				$rooms_available[$room_type_id] = $this->getAvailableRoomNumber($checkInDate, $checkOutDate, $room_type_id);
				
			}
		} catch (\Exception $e) {
			$result = [
				'status' => false,
				'code' => $e->getCode(),
				'message' => $e->getMessage()
			];
			
			return response()->json($result, 500);
		}
		
		
		if ($request->withRoomDetails) {
			$room_type_details = RoomType::with('room')
				->orderBy('id', 'asc')->get();
			
			foreach ($room_type_details as $key => $room_type) {
				$room_type->available_room = $rooms_available[$key + 1];
			}
			return response()->json($room_type_details);
		}
		
		return response()->json($rooms_available);
		
	}
	
	public function updateReservationStatus(Request $request)
	{
		$validator = Validator::make($request->all(), [
			'transactionId' => 'required',
			'sessionId' => 'required'
		]);
		if ($validator->fails()) {
			return ErrorController::validationError("paypalError");
		} else {
			
			DB::beginTransaction();
			try {
				$reservation = Reservation::where('session', $request->sessionId)->with(['reservationDetails.roomType'])->first();
				$reservation->transaction_id = $request->transactionId;
				$reservation->status = "completed";
				$reservation->save();
				
				$reservationDetails = ReservationDetails::where('reservation_id', $reservation->id)->get();
				foreach ($reservationDetails as $reservationDetail) {
					$reservationDetail->status = $reservation->status;
					$reservationDetail->status_time = $reservation->updated_at;
					$reservationDetail->save();
				}
				DB::commit();
			} catch (\Exception $e) {
				DB::rollback();
				return ErrorController::internalError("UpdateReservationError");
			}
			
			// send email
			$reservation->total_rooms = count($reservation->reservationDetails);
			$reservation->total_nights = $this->getTotalNight($reservation->check_in, $reservation->check_out);
			$reservation->notify(new ReservationPaid($reservation));
			
			return ErrorController::successMessage($request->transactionId);
		}
		
	}
	
	public function testEmail()
	{
		$reservation = Reservation::where('id', '99')->with(['reservationDetails.roomType'])->first();
		$reservation->total_rooms = count($reservation->reservationDetails);
		$reservation->total_nights = $this->getTotalNight($reservation->check_in, $reservation->check_out);
//		dd($reservation);
		$reservation->notify(new ReservationPaid($reservation));
	}
	
	public function getAvailableRoomNumber($checkInDate, $checkOutDate, $roomTypeId)
	{
		// select all rooms and count no of rooms of that room type
		$total_no_of_rooms = Room::where('room_type_id', $roomTypeId)->count();
		
		$passingCheckIn = ReservationDetails::where(function ($q1) use ($checkInDate, $checkOutDate) {
			
			$q1->where(function ($q) use ($checkInDate) {
				$q->where('start_date', '<=', $checkInDate)->where('end_date', '>', $checkInDate);
			})->orwhere(function ($q) use ($checkInDate, $checkOutDate) {
				$q->where('start_date', '>=', $checkInDate)->where('end_date', '<=', $checkOutDate);
			})->orwhere(function ($q) use ($checkOutDate) {
				$q->where('start_date', '<', $checkOutDate)->where('end_date', '>=', $checkOutDate);
			});
		})->where(function ($query) {
			$query->where('status', 'waiting_for_payment')
				->orWhere('status', 'completed');
		})->where('room_type_id', $roomTypeId)->distinct('room_id')->count();
		
		// count available room
		$avail_room = $total_no_of_rooms - $passingCheckIn;
		
		return $avail_room;
	}
	
	public function getAvailableRoomId($checkInDate, $checkOutDate, $roomTypeId)
	{
		$allRoomId = Room::where('room_type_id', $roomTypeId)->get()->pluck('id')->toArray();
		// select all rooms and count no of rooms of that room type
		$roomOccupied = ReservationDetails::where(function ($q1) use ($checkInDate, $checkOutDate) {
			
			$q1->where(function ($q) use ($checkInDate) {
				$q->where('start_date', '<=', $checkInDate)->where('end_date', '>', $checkInDate);
			})->orwhere(function ($q) use ($checkInDate, $checkOutDate) {
				$q->where('start_date', '>=', $checkInDate)->where('end_date', '<=', $checkOutDate);
			})->orwhere(function ($q) use ($checkOutDate) {
				$q->where('start_date', '<', $checkOutDate)->where('end_date', '>=', $checkOutDate);
			});
		})->where(function ($query) {
			$query->where('status', 'waiting_for_payment')
				->orWhere('status', 'completed');
		})->where('room_type_id', $roomTypeId)->distinct('room_id')->get()->pluck('room_id')->toArray();
		
		$roomAvail = array_values(array_diff($allRoomId, $roomOccupied));
		return $roomAvail;
	}
	
	public function reorderReservation($roomTypeId)
	{
		
		$today = date('Y-m-d');
		
		// select all rooms and count no of rooms of that room type
		$count_rooms = Room::select('id')->where('room_type_id', $roomTypeId)->get();
		
		// select all room orders that cannot be changed
		$fixed_block = ReservationDetails::where('start_date', '<', $today)->where('end_date', '>=', $today)->where('room_type_id', $roomTypeId)->get();
		
		// select all other room orders that after today and order by start date
		$movement_block = ReservationDetails::where('start_date', '>=', $today)->orderBy('start_date', 'asc')->orderBy('end_date', 'asc')->get();
		
		// define an empty room array
		$rooms = [];
		
		// add start date of each room into the empty room array
		for ($i = 0; $i < count($count_rooms); $i++) {
			$rooms[$count_rooms{$i}->id] = '';
			foreach ($fixed_block as $key => $v) {
				// if there is order cannot be changed,
				// add the end date to room array as start date
				if ($v->room_id == $count_rooms{$i}->id) {
					$rooms[$count_rooms{$i}->id] = $v->end_date;
					break;
				}
			}
			
		}
		
		// loop room array
		foreach ($rooms as $key => &$v) {
			// loop room orders
			foreach ($movement_block as $key1 => $v1) {
				// if the start date of room order >= room's start date
				// means the room order is the nearest next order of that room
				if ($v1->start_date >= $v) {
					// update room array's start date
					$v = $v1->end_date;
					// change the order room id to current room id
					$v1->room_id = $key;
					// then add the room order to the "order cannot be changed" array
					$fixed_block->push($v1);
					// and forget the one in room order array
					$movement_block->forget($key1);
				}
			}
		}
		
		// update room order in database
		foreach ($fixed_block as $v) {
			ReservationDetails::where('id', $v->id)->update(['room_id' => $v->room_id]);
		}
	}
	
	public function deleteInvalidReservation()
	{
		$reservations = Reservation::where(function ($query) {
			$query->where('status', 'waiting_for_payment')
				->orWhereNull('status');
		})
			->whereTime('created_at', '<', Carbon::now()->subMinutes(30)->toDateTimeString());
		
		$reservations->delete();
		
		
		$reservationDetails = ReservationDetails::where(function ($query) {
			$query->where('status', 'waiting_for_payment')
				->orWhereNull('status');
		})
			->whereTime('created_at', '<', Carbon::now()->subMinutes(30)->toDateTimeString());
		
		$reservationDetails->delete();
		
	}
	
	private function validateRoomObjects($roomObjects)
	{
		try {
			if (count($roomObjects) != 3) {
				return false;
			}
			$noOfRoom = 0;
			foreach ($roomObjects as $roomType) {
				$noOfRoom = $noOfRoom + $roomType['noOfRoom'];
			}
			
			if ($noOfRoom <= 0) {
				return false;
			}
		} catch (\Exception $e) {
			return false;
		}
		return true;
	}
	
	private function validateOrder($order)
	{
		try {
			$valid = $this->validateRoomObjects($order['roomObjects']);
			
			if (!$valid) {
				return $valid;
			} else {
				$totalGuests = $order['adults'] + $order['children'];
				$totalRoomCapacity = 0;
				$totalNight = $this->getTotalNight($order['checkIn'], $order['checkOut']);
				$totalPrice = 0;
				foreach ($order['roomObjects'] as $room) {
					$noOfRoom = $room['noOfRoom'];
					$totalRoomCapacity = $totalRoomCapacity + ($room['capacity'] + $room['mattress']) * $noOfRoom;
					
					$roomPrice = RoomType::where('id', $room['id'])->first()->price;
					$totalPrice = $totalPrice + ((($noOfRoom * $roomPrice) + ($room['mattress'] * $this->mattressPrice) + ($room['breakfast'] * $this->breakfastPrice))) * $totalNight;
				}
				if ($totalGuests > $totalRoomCapacity) {
					return false;
				}
				if ($totalPrice != $order['totalPrice']) {
					return false;
				}
			}
		} catch (\Exception $e) {
			return false;
		}
		return true;
	}
	
	private function getTotalNight($checkIn, $checkOut)
	{
		$checkIn = Carbon::parse($checkIn);
		$checkOut = Carbon::parse($checkOut);
		return $checkIn->diffInDays($checkOut);
	}
}
