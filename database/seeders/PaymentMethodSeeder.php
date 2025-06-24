<?php

namespace Database\Seeders;

use App\Models\PaymentMethod;
use Illuminate\Database\Seeder;

class PaymentMethodSeeder extends Seeder
{
    public function run(): void
    {
        $paymentMethods = [
            [
                'name' => 'Transfer Bank',
                'code' => 'bank_transfer',
                'type' => 'bank_transfer',
                'config' => [
                    'banks' => [
                        'bca' => 'Bank Central Asia',
                        'mandiri' => 'Bank Mandiri',
                        'bni' => 'Bank Negara Indonesia'
                    ]
                ],
                'is_active' => true,
            ],
            [
                'name' => 'E-Wallet',
                'code' => 'e_wallet',
                'type' => 'e_wallet',
                'config' => [
                    'providers' => [
                        'gopay' => 'GoPay',
                        'ovo' => 'OVO',
                        'dana' => 'DANA'
                    ]
                ],
                'is_active' => true,
            ],
            [
                'name' => 'Kartu Kredit',
                'code' => 'credit_card',
                'type' => 'credit_card',
                'config' => [
                    'processors' => [
                        'visa' => 'Visa',
                        'mastercard' => 'Mastercard',
                        'jcb' => 'JCB'
                    ]
                ],
                'is_active' => true,
            ],
        ];

        foreach ($paymentMethods as $method) {
            PaymentMethod::create($method);
        }
    }
} 