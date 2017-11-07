<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RoomImage extends Model
{
	use SoftDeletes;
	
	/*
     * ============================================================================================================================================
     * Settings
     * ============================================================================================================================================
     */
	protected $dates = ['deleted_at'];
	
	/*
     * ============================================================================================================================================
     * Relationships
     * ============================================================================================================================================
     */
	public function room()
	{
		return $this->belongsTo('App\Models\Room');
	}
	
	public function reservationDetails()
	{
		return $this->belongsTo('App\Models\ReservationDetails', 'room_id');
	}
}
