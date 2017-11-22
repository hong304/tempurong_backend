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
    Route::post('/activity', 'ActivityController@getActivity');

    Route::get('/room', 'RoomController@getRoom')->name('room.index');
    //Admin
    Route::get('orderHistory', 'AdminController@getOrderHistory');
    //rome type
    Route::get('/room-type', 'RoomTypeController@getRoomType');
    Route::post('/room-type', 'RoomTypeController@postRoomType');
    //reservation
    Route::get('/reservation', 'ReservationController@getReservation')->name('reservation.index');
    Route::post('/reservation', 'ReservationController@postReservation')->name('reservation.store');
    Route::post('/checkAvailableRooms', 'ReservationController@postCheckAvailableRooms');

});