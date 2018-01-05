<?php

namespace App\Http\Controllers;

use App\Models\Amenity;
use App\Models\Room;
use App\Models\RoomType;
use Illuminate\Http\Request;

class RoomTypeController extends Controller
{
  public function getRoomType()
  {
    $rooms = RoomType::with('room')
      ->orderBy('id', 'asc')->get();

    return response()->json($rooms);
  }

  public function postRoomType(Request $request)
  {
    $rooms = RoomType::where('id', $request->typeId)->with(['room' => function ($q) {
      $q->with('images');
    }])->first();

    return response()->json($rooms);
  }

  public function getAmenities()
  {
    $amenities = Amenity::all();

    return response()->json($amenities);
  }

}
