<?php

namespace App\Notifications;

use Illuminate\Auth\Notifications\ResetPassword as ResetPasswordNotification;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\Config;

class CustomResetPassword extends ResetPasswordNotification
{
    public function toMail($notifiable)
    {
        $frontendUrl = Config::get('app.frontend_url', 'http://localhost:8100');
        $url = $frontendUrl . '/reset-password?token=' . $this->token . '&email=' . urlencode($notifiable->getEmailForPasswordReset());

        return (new MailMessage)
            ->subject('Reset Password Notification')
            ->view('emails.reset-password', ['actionUrl' => $url]);
    }
} 