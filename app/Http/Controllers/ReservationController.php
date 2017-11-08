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

    }
}
