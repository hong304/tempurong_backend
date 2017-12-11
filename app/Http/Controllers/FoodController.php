<?php

namespace App\Http\Controllers;

use App\Models\Food;

class FoodController extends Controller
{
  public function getFood()
  {
    $food = Food::all();
    return response()->json($food);
  }

}
