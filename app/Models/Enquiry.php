<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Enquiry extends Model
{
  use Notifiable;

  /**
   * Route notifications for the mail channel.
   *
   * @return string
   */
  public function routeNotificationForMail()
  {
    return config('mail.enquiry_to.address');
  }

  /*
   * ============================================================================================================================================
   * Settings
   * ============================================================================================================================================
   */


  /*
   * ============================================================================================================================================
   * Relationships
   * ============================================================================================================================================
   */


}
