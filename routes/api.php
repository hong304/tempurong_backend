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
	Route::get('/room', 'RoomController@getRoom')->name('room.index');

	//rome type
    Route::get('/room-type','RoomTypeController@getRoomType');
	//reservation
    Route::get('/reservation', 'ReservationController@getReservation')->name('reservation.index');
    Route::post('/reservation', 'ReservationController@postReservation')->name('reservation.store');
    Route::post('/checkAvailableRooms','ReservationController@postCheckAvailableRooms');

});