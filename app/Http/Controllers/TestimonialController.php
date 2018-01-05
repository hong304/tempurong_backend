<?php

namespace App\Http\Controllers;


use App\Models\Testimonials;
use Illuminate\Http\Request;

class TestimonialController extends Controller
{
  public function getTestimonials(Request $request)
  {
    $chinese = 1;
    if ($request->lang === 'en') {
      $chinese = 0;
    }
    $testimonial = Testimonials::where('chinese', $chinese)->orderBy('created_at', 'desc')->take(3)->get();


    return response()->json($testimonial);
  }

}
