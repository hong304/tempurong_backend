<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ReservationDetails extends Model
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
	
	public function images()
	{
		return $this->hasMany('App\Models\RoomImage', 'room_id');
	}
	
	public function roomType()
	{
		return $this->belongsTo('App\Models\RoomType');
	}
	
	public function reservation()
	{
		return $this->belongsTo('App\Models\Reservation');
	}
}
