<?php

namespace App\Http\Controllers;

use App\Models\Room;
use Illuminate\Http\Request;

class RoomController extends Controller
{
	public function getRoom()
	{
		$rooms = Room::with('images')
						->with('roomType')
						->with('reservationDetails')
						->get();
		
		return response()->json($rooms);
	}
}
