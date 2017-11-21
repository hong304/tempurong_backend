<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\ReservationDetails;
use App\Models\Room;
use App\Models\RoomType;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
	public function getReservation()
	{
		$data = Reservation::with(['reservationDetails.roomType', 'reservationDetails.images'])
			->get();
		
		return response()->json($data);
	}
	
	public function postReservation()
	{
		if (isset($_SERVER['HTTP_POSTMAN_TOKEN']))
			var_dump('200 OK');
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
//            $checkInDate = '2017-12-03';
//            $checkOutDate = '2017-12-07';
		try {
			foreach ($room_type_ids as $k => $room_type_id) {
				
				$today = date('Y-m-d');
				$today = '2017-12-02';
				
				
				// select all rooms and count no of rooms of that room type
				$count_rooms = Room::select('id')->where('room_type_id', $room_type_id)->get();
				$total_no_of_rooms = count($count_rooms);
				
				// select all room orders that cannot be changed
				$fixed_block = ReservationDetails::where('start_date', '<', $today)->where('end_date', '>=', $today)->where('room_type_id', $room_type_id)->get();
				
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
				
				
				// select available room again
				$passingCheckIn = ReservationDetails::select('room_id')->where(function ($q1) use ($checkInDate, $checkOutDate) {
					
					$q1->where(function ($q) use ($checkInDate) {
						$q->where('start_date', '<=', $checkInDate)->where('end_date', '>', $checkInDate);
					})->orwhere(function ($q) use ($checkInDate, $checkOutDate) {
						$q->where('start_date', '>=', $checkInDate)->where('end_date', '<=', $checkOutDate);
					})->orwhere(function ($q) use ($checkOutDate) {
						$q->where('start_date', '<', $checkOutDate)->where('end_date', '>=', $checkOutDate);
					});
				})->whereNull('status')->where('room_type_id', $room_type_id)->distinct('room_id')->get()->pluck('room_id');
				
				// count available room
				$total_no_of_rooms_occupied = count($passingCheckIn);
				$avail_room = $total_no_of_rooms - $total_no_of_rooms_occupied;
				
				// put available room value to array
				$rooms_available[$room_type_id] = $avail_room;
				
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
}
