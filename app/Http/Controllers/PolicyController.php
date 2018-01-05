<?php

namespace App\Http\Controllers;


use App\Models\Faq;
use App\Models\Policy;

class PolicyController extends Controller
{
  public function getFaqs()
  {
    $faqs = Faq::all();
    return response()->json($faqs, 200);
  }

  public function getPolicies()
  {
    $policies = Policy::all();
    return response()->json($policies, 200);
  }

}
