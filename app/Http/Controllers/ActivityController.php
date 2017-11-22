<?php

namespace App\Http\Controllers;

use App\Models\Activity;
use Illuminate\Http\Request;

class ActivityController extends Controller
{
    public function getActivity(Request $request)
    {
        $activity = Activity::where('id', $request->activityId)->with('images')->first();
        return response()->json($activity);
    }
}
