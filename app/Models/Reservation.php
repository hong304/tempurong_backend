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
	protected $columns = array('id','first_name','last_name','transaction_id','email','country_code','tel','adults','children','check_in','check_out','language','remarks','addition_note','amount','payment_method','created_at','updated_at','deleted_at','status','session','refund_at','refund_amount','internal_note');
	
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
	
	/*
     * ============================================================================================================================================
     * Mutator
     * ============================================================================================================================================
     */
	public function getRemarksAttribute($value)
	{
		return nl2br($value);
	}
	
	public function getAdditionNoteAttribute($value)
	{
		return nl2br($value);
	}
	
	public function scopeExclude($query,$value = array())
	{
		return $query->select( array_diff( $this->columns,(array) $value) );
	}
}

