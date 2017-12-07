<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Reservation extends Model
{
	use SoftDeletes;
	use Notifiable;
	
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
	public function reservationDetails()
	{
		return $this->hasMany('App\Models\ReservationDetails');
	}
	
	public function routeNotificationForMail()
	{
		return $this->email;
	}
}

