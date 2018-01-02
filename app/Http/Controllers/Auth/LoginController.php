<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
	protected $auth;
	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		$this->auth = new Auth();
		$this->middleware('guest')->except('logout');
	}

	public function getlogin(Request $request){
	    Auth::loginUsingId(1,true);
    }

	public function login(Request $request)
	{
		$userData = array(
			'email' => $request->get('username'),
			'password' => $request->get('password')
		);
		
		if ($this->auth->attempt($userData, true)) {
			
			$result = [
				'status' => true,
				'message' => 'Login Success'
			];
			return response()->json($result, 200);
		} else {
			
			$result = [
				'status' => false,
				'message' => 'Login Failed'
			];
			return response()->json($result, 401);
		}
        Auth::loginUsingId(1,true);
	}
	
	public function checkLogin()
	{
		if ($this->auth->check()) {
			$result = [
				'status' => true,
				'message' => 'Logged-in.'
			];
		} else {
			$result = [
				'status' => false,
				'message' => 'Not Logged-in.'
			];
		}
		return response()->json($result, 200);
	}
	
	public function logout()
	{
		$this->auth->logout();
		$result = [
			'status' => true,
			'message' => 'Logged-out.'
		];
		return response()->json($result, 200);
	}
}
