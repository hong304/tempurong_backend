<?php
/**
 * PayPal Setting & API Credentials
 * Created by Raza Mehdi <srmk@outlook.com>.
 */

return [
	'mode' => env('PAYPAL_MODE', 'sandbox'), // Can only be 'sandbox' Or 'live'. If empty or invalid, 'live' will be used.
	'sandbox' => [
		'username' => env('PAYPAL_SANDBOX_API_USERNAME', 'sabahtvlkk30-facilitator_api1.hotmail.com'),
		'password' => env('PAYPAL_SANDBOX_API_PASSWORD', 'JZ6V4MTZL6YGBUGD'),
		'secret' => env('PAYPAL_SANDBOX_API_SECRET', 'A6IMd0-qVtwouvGQzlxjVmjgRGI8Al4z3EQ4c5HkoQ84GKldCDSg35es'),
		'certificate' => env('PAYPAL_SANDBOX_API_CERTIFICATE', ''),
		'app_id' => '', // Used for testing Adaptive Payments API in sandbox mode
	],
	'live' => [
		'username' => env('PAYPAL_LIVE_API_USERNAME', ''),
		'password' => env('PAYPAL_LIVE_API_PASSWORD', ''),
		'secret' => env('PAYPAL_LIVE_API_SECRET', ''),
		'certificate' => env('PAYPAL_LIVE_API_CERTIFICATE', ''),
		'app_id' => '', // Used for Adaptive Payments API
	],
	
	'payment_action' => 'Order', // Can only be 'Sale', 'Authorization' or 'Order'
	'currency' => 'MYR',
	'notify_url' => '', // Change this accordingly for your application.
	'locale' => 'en_US', // force gateway language  i.e. it_IT, es_ES, en_US ... (for express checkout only)
];
