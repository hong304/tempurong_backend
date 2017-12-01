<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ErrorController extends Controller
{
	public static function validationError($errorName)
	{
		$result = [
			'status' => false,
			'message' => $errorName
		];
		return response()->json($result, 422);
	}
	
	public static function internalError($errorName)
	{
		$result = [
			'status' => false,
			'message' => $errorName
		];
		return response()->json($result, 500);
	}
	
	public static function successMessage($successMessage)
	{
		$result = [
			'status' => true,
			'message' => $successMessage
		];
		return response()->json($result, 200);
	}
}
