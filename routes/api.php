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
  // activity
  Route::get('/activity', 'ActivityController@getActivity');
  Route::get('/adventure', 'ActivityController@getAdventure');

  // food
  Route::get('/food', 'FoodController@getFood');

  // rome
  Route::get('/room', 'RoomController@getRoom')->name('room.index');
  Route::get('/room-type', 'RoomTypeController@getRoomType');
  Route::post('/room-type', 'RoomTypeController@postRoomType');

  // reservation
  Route::get('/reservation', 'ReservationController@getReservation')->name('reservation.index');
  Route::post('/reservation', 'ReservationController@postReservation')->name('reservation.store');
  Route::post('/reservation/update', 'ReservationController@updateReservationStatus')->name('reservation.update');
  Route::post('/checkAvailableRooms', 'ReservationController@postCheckAvailableRooms');
	
  // enquiry
  Route::post('/enquiry', 'EnquiryController@sendEnquiryForm');
	
  // admin
  Route::post('/login', 'Auth\LoginController@login');
  Route::get('/check-login', 'Auth\LoginController@checkLogin');

});

Route::group(['middleware' => 'auth'], function () {
	Route::get('logout', 'Auth\LoginController@logout');

	// admin
	Route::get('orderHistory', 'AdminController@getOrderHistory');
	Route::post('orderHistory', 'AdminController@postOrderHistory');
	Route::get('orderHistorySummarize', 'AdminController@getOrderHistorySummarize');
	
});