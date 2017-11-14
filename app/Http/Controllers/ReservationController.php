<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\ReservationDetails;
use Carbon\Carbon;
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

    public function postCheckAvailableRooms(Request $request)
    {
        $checkInDate = $request->start_date;
        $checkOutDate = $request->end_date;

        $today = date('Y-m-d');

        $fixed_block = ReservationDetails::where('start_date', '<', '2017-12-02')->get();
        $movement_block = ReservationDetails::where('start_date', '>=', '2017-12-02')->orderBy('start_date', 'asc')->orderBy('end_date', 'asc')->get();
        dd($fixed_block->toArray());


        $checking_room_ = [
            ['room_id' => 1, 'date' => '2017-12-03'],
            ['room_id' => 2, 'date' => '2017-12-02'],
            ['room_id' => 3, 'date' => '2017-12-05'],
            ['room_id' => 4, 'date' => '2017-12-02'],
            ['room_id' => 5, 'date' => '2017-12-02'],
            ['room_id' => 6, 'date' => '2017-12-02'],
        ];

        foreach($checking_room_ as $k => &$v){
            foreach ($movement_block as $k1 => $v1){
                if($v1->start_date >= $v['date']){
                    $v['date'] = $v1->end_date;
                    $v1->room_id = $v['room_id'];
                    $fixed_block->push($v1);
                    $movement_block->forget($k1);
                }
            }
        }

        dump($checking_room_);
        dump($fixed_block->toArray());
        dd($movement_block->toArray());

        $passingCheckIn = ReservationDetails::select('room_id')->where(function ($q1) use ($checkInDate, $checkOutDate) {

            $q1->where(function ($q) use ($checkInDate) {
                $q->where('start_date', '<=', $checkInDate)->where('end_date', '>', $checkInDate);
            })->orwhere(function ($q) use ($checkInDate, $checkOutDate) {
                $q->where('start_date', '>=', $checkInDate)->where('end_date', '<=', $checkOutDate);
            })->orwhere(function ($q) use ($checkOutDate) {
                $q->where('start_date', '<', $checkOutDate)->where('end_date', '>=', $checkOutDate);
            });
        })->whereNull('status')->distinct('room_id')->get()->pluck('room_id');


        if (isset($_SERVER['HTTP_POSTMAN_TOKEN']))
            dd($passingCheckIn);
    }
}
