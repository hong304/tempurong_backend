<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ReservationPaid extends Notification
{
	use Queueable;
	
	protected $reservation;
	
	/**
	 * Create a new notification instance.
	 *
	 * @return void
	 */
	public function __construct($reservation)
	{
		$this->reservation = $reservation;
	}
	
	/**
	 * Get the notification's delivery channels.
	 *
	 * @param  mixed $notifiable
	 * @return array
	 */
	public function via($notifiable)
	{
		return ['mail'];
	}
	
	/**
	 * Get the mail representation of the notification.
	 *
	 * @param  mixed $notifiable
	 * @return \Illuminate\Notifications\Messages\MailMessage
	 */
	public function toMail($notifiable)
	{
		if ($this->reservation->language == 'sc') {
			return (new MailMessage)
				->subject("谢谢您的订单，订单已确认。")
				->view('emails.confirmation-mail-sc', ['reservation' => $this->reservation]);
		} else {
			return (new MailMessage)
				->subject("Thank you for your reservation, the reservation is confirmed.")
				->view('emails.confirmation-mail', ['reservation' => $this->reservation]);
		}
	}
	
	/**
	 * Get the array representation of the notification.
	 *
	 * @param  mixed $notifiable
	 * @return array
	 */
	public function toArray($notifiable)
	{
		return [
			//
		];
	}
}
