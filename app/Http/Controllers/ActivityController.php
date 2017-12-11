<?php

namespace App\Http\Controllers;

use App\Models\Activity;

class ActivityController extends Controller
{
    public function getActivity()
    {
        $activity = Activity::whereNotNull('difficulty')->get();
        return response()->json($activity);
    }

    public function getAdventure()
    {
        $adventure = Activity::whereNotNull('difficulty')->with('images')->get();
        return response()->json($adventure);
    }
}
