<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Notifications\CustomResetPassword;
use App\Notifications\CustomEmailVerification;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'birth_date',
        'role',
        'gender',
        'email_verification_token',
        'email_verification_code',
        'email_verification_expires_at',
    ];

    // Model User
    public function carts()
    {
        return $this->hasMany(Cart::class);
    }


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'email_verification_token',
        'email_verification_code',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'email_verification_expires_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new CustomResetPassword($token));
    }

    public function sendEmailVerificationNotification()
    {
        $this->notify(new CustomEmailVerification());
    }

    /**
     * Generate OTP code for email verification
     */
    public function generateEmailVerificationCode()
    {
        $code = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
        $this->email_verification_code = $code;
        $this->email_verification_expires_at = now()->addMinutes(10); // 10 menit expiry
        $this->save();
        
        return $code;
    }

    /**
     * Verify OTP code
     */
    public function verifyEmailCode($code)
    {
        if ($this->email_verification_code === $code && 
            $this->email_verification_expires_at && 
            $this->email_verification_expires_at->isFuture()) {
            
            $this->markEmailAsVerified();
            $this->email_verification_code = null;
            $this->email_verification_expires_at = null;
            $this->save();
            
            return true;
        }
        
        return false;
    }
}
