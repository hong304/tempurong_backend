<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\ReservationDetails;
use App\Models\Room;
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

        foreach ($room_type_ids as $k => $room_type_id) {



//            $checkInDate = '2017-12-03';
//            $checkOutDate = '2017-12-07';

            $today = date('Y-m-d');
            $today = '2017-12-02';
            $rooms = [];


            $count_rooms = Room::select('id')->where('room_type_id', $room_type_id)->get();
            $fixed_block = ReservationDetails::where('start_date', '<', $today)->where('end_date', '>=', $today)->where('room_type_id', $room_type_id)->get();
            $movement_block = ReservationDetails::where('start_date', '>=', $today)->orderBy('start_date', 'asc')->orderBy('end_date', 'asc')->get();

            $total_no_of_rooms = count($count_rooms);

            for ($i = 0; $i < count($count_rooms); $i++) {
                foreach ($fixed_block as $k => $v) {
                    if ($v->room_id == $count_rooms{$i}->id) {
                        $rooms[$count_rooms{$i}->id] = $v->end_date;
                        break;
                    } else
                        $rooms[$count_rooms{$i}->id] = '';
                }

            }

            foreach ($rooms as $k => &$v) {
                foreach ($movement_block as $k1 => $v1) {
                    if ($v1->start_date >= $v) {
                        $v = $v1->end_date;
                        $v1->room_id = $k;
                        $fixed_block->push($v1);
                        $movement_block->forget($k1);
                    }
                }
            }

            foreach ($fixed_block as $v) {
                ReservationDetails::where('id', $v->id)->update(['room_id' => $v->room_id]);
            }

            $passingCheckIn = ReservationDetails::select('room_id')->where(function ($q1) use ($checkInDate, $checkOutDate) {

                $q1->where(function ($q) use ($checkInDate) {
                    $q->where('start_date', '<=', $checkInDate)->where('end_date', '>', $checkInDate);
                })->orwhere(function ($q) use ($checkInDate, $checkOutDate) {
                    $q->where('start_date', '>=', $checkInDate)->where('end_date', '<=', $checkOutDate);
                })->orwhere(function ($q) use ($checkOutDate) {
                    $q->where('start_date', '<', $checkOutDate)->where('end_date', '>=', $checkOutDate);
                });
            })->whereNull('status')->where('room_type_id', $room_type_id)->distinct('room_id')->get()->pluck('room_id');

            $total_no_of_rooms_occupied = count($passingCheckIn);

            $ava_room = $total_no_of_rooms - count($passingCheckIn);

//            dump($total_no_of_rooms);
//            dd($passingCheckIn);
//            dd(count($count_rooms));
            $rooms_available[$room_type_id] = $ava_room;

        }

        if (isset($_SERVER['HTTP_POSTMAN_TOKEN']))
            dd('hi');

        return $rooms_available;

    }
}
