<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Console\Parser;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
	/*
	|--------------------------------------------------------------------------
	| Login Controller
	|--------------------------------------------------------------------------
	|
	| This controller handles authenticating users for the application and
	| redirecting them to your home screen. The controller uses a trait
	| to conveniently provide its functionality to your applications.
	|
	*/
	
	use AuthenticatesUsers;
	
	/**
	 * Where to redirect users after login.
	 *
	 * @var string
	 */
	protected $redirectTo = '/';
	
	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		$this->middleware('guest')->except('logout');
	}

	public function getlogin(Request $request){
	    Auth::loginUsingId(1,true);
    }

	public function login(Request $request)
	{
    if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
      $user = Auth::user();

      $result = [
        'status' => true,
        'message' => 'Login Success',
        'token' => $user->createToken($user->name)->accessToken
      ];
      return response()->json($result, 200);
    }
    else{

      $result = [
        'status' => false,
        'message' => 'Login Failed'
      ];

      return response()->json($result, 401);
    }
	}
	
	public function checkLogin()
	{
	  if (Auth::check()) {
      $user = Auth::user();
      $result = [
        'status' => true,
        'message' => 'Logged-in.',
        'user_data' => $user
      ];
    } else {
      $result = [
        'status' => false,
        'message' => 'Not Logged-in.'
      ];
    }
    return response()->json($result, 200);
	}
	
	public function logout(Request $request)
	{
    $value = $request->bearerToken();
    $id = (new Parser())->parse($value)->getHeader('jti');

    $token = DB::table('oauth_access_tokens')
      ->where('id', '=', $id)
      ->update(['revoked' => true]);

    $this->guard()->logout();

    $request->session()->flush();

    $request->session()->regenerate();

    $result = [
      'status' => true,
      'message' => 'You are Logged out.'
    ];

    return response()->json($result, 200);
	}
}
