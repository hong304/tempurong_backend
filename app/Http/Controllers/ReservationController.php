<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
	public function getReservation()
	{
		$data = Reservation::with(['reservationDetails.roomType', 'reservationDetails.images'])
			->get();
		
		return response()->json($data);
	}

	public function postReservation(){
        if(isset($_SERVER['HTTP_POSTMAN_TOKEN']))
            var_dump('200 OK');
    }
}
