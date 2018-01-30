<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
	return $request->user();
});

Route::group(['middleware' => 'guest'], function () {
	
	Route::post('/testimonial', 'TestimonialController@getTestimonials');
	
	// activity
	Route::get('/activity', 'ActivityController@getActivity');
	Route::get('/adventures', 'ActivityController@getAdventure');
	Route::get('/walking-distance', 'ActivityController@getWalkingDistance');
	
	// food
	Route::get('/food', 'FoodController@getFood');
	
	// rome
	Route::get('/room', 'RoomController@getRoom')->name('room.index');
	Route::get('/room-type', 'RoomTypeController@getRoomType');
	Route::get('/amenities', 'RoomTypeController@getAmenities');
	Route::post('/room-type', 'RoomTypeController@postRoomType');
	
	// reservation
	Route::get('/reservation', 'ReservationController@getReservation')->name('reservation.index');
	Route::post('/reservation', 'ReservationController@postReservation')->name('reservation.store');
	Route::post('/reservation/update', 'ReservationController@updateReservationStatus')->name('reservation.update');
	Route::post('/checkAvailableRooms', 'ReservationController@postCheckAvailableRooms');
	Route::post('orderHistory', 'AdminController@postOrderHistory');
	Route::get('/getEnvironment', 'ReservationController@getEnvironment');
	Route::post('/refund', 'AdminController@refundTransaction');
	
	
	// policy
	Route::get('/faqs', 'PolicyController@getFaqs');
	Route::get('/policies', 'PolicyController@getPolicies');
	
	// enquiry
	Route::post('/enquiry', 'EnquiryController@sendEnquiryForm');
	
	// admin
	Route::post('/login', 'Auth\LoginController@login');
	Route::get('/check-login', 'Auth\LoginController@checkLogin');
	
});

Route::group(['middleware' => 'auth'], function () {
	Route::get('profile', 'Auth\LoginController@getProfile');
	Route::post('profile', 'Auth\LoginController@updateProfile');
	Route::get('logout', 'Auth\LoginController@logout');
	
	// admin
	Route::post('adminOrderHistory', 'AdminController@getOrderHistory');
	Route::get('orderHistorySummarize', 'AdminController@getOrderHistorySummarize');
	Route::post('saveInternalNote', 'AdminController@saveInternalNote');
	Route::post('/reservation/skip-payment', 'ReservationController@reserveWithoutPay')->name('admin.reservation.update');
	
	//test email
	Route::get('/email/{id?}', 'ReservationController@testEmail')->name('email.test');
	
//	Route::get('/reservation/delete', 'ReservationController@deleteInvalidReservation')->name('reservation.delete');
	
});