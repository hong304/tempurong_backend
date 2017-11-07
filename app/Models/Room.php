<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Room extends Model
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
	public function images()
	{
		return $this->hasMany('App\Models\RoomImage');
	}
	
	public function roomType()
	{
		return $this->belongsTo('App\Models\RoomType');
	}
	
	public function reservationDetails()
	{
		return $this->hasMany('App\Models\ReservationDetails');
	}
}
