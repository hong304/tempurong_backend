<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class EnquiryNotification extends Notification
{
    use Queueable;


    public $enquiry;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($enquiry)
    {
        //
        $this->enquiry = $enquiry;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $enquiry = $this->enquiry;
      return (new MailMessage)
        ->subject("Your enquiry has been sent.")
        ->view('emails.enquiry-mail', compact('enquiry'));

    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }

}
