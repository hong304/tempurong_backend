<?php

namespace App\Http\Controllers;

use App\Models\Activity;
use App\Models\Adventure;
use App\Models\WalkingDistance;

class ActivityController extends Controller
{
  public function getActivity()
  {
    $activity = Activity::all();
    return response()->json($activity, 200);
  }

  public function getAdventure()
  {
    $adventure = Adventure::with('images')->get();
    return response()->json($adventure, 200);
  }

  public function getWalkingDistance()
  {
    $walkingDistance = WalkingDistance::all();
    return response()->json($walkingDistance, 200);
  }
}
