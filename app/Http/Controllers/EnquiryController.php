<?php

namespace App\Http\Controllers;

use App\Models\Enquiry;
use App\Notifications\EnquiryNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EnquiryController extends Controller
{
  public function sendEnquiryForm(Request $request)
  {
//    if ($request->get('g-recaptcha-response')) {
//      $request['captcha'] = $this->captchaCheck($request->get('g-recaptcha-response'));
//    }

//    dd($request->all());
    $validator = Validator::make($request->all(), [
      'firstName' => 'Required',
      'lastName' => 'Required',
      'email' => 'Required|Email',
      'message' => 'Required'
//      'g-recaptcha-response' => 'required',
//      'captcha' => 'required|in:1'
    ], [
//      'g-recaptcha-response.required' => 'Captcha is required.',
//      'captcha.in' => 'Wrong captcha, please try again.'
    ]);

    if ($validator->fails()) {
      return ErrorController::validationError("enquiryInfoError");
    }

    $enquiry = New Enquiry();
    $enquiry->first_name = $request->firstName;
    $enquiry->last_name = $request->lastName;
    $enquiry->email = $request->email;
    $enquiry->message = $request->message;
    $enquiry->save();

    //send email here
    $enquiry->notify(new EnquiryNotification($enquiry));

    return ErrorController::successMessage('enquirySubmitSuccess');
  }

}
