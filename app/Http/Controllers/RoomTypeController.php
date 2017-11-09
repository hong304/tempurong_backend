<?php

namespace App\Http\Controllers;

use App\Models\Room;
use App\Models\RoomType;
use Illuminate\Http\Request;

class RoomTypeController extends Controller
{
	public function getRoomType()
	{
		$rooms = RoomType::with('room')
						->get();
		
		return response()->json($rooms);
	}
}