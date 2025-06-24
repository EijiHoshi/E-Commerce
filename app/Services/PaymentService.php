<?php

namespace App\Services;

use App\Models\Order;
use App\Models\Payment;
use App\Models\PaymentMethod;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class PaymentService
{
    protected $notificationService;

    public function __construct(NotificationService $notificationService)
    {
        $this->notificationService = $notificationService;
    }

    public function createPayment(Order $order, PaymentMethod $paymentMethod)
    {
        try {
            // Implementasi integrasi dengan payment gateway
            $response = $this->processPaymentGateway($order, $paymentMethod);

            $payment = Payment::create([
                'order_id' => $order->id,
                'payment_method_id' => $paymentMethod->id,
                'amount' => $order->total_amount,
                'status' => 'pending',
                'payment_details' => $response
            ]);

            // Kirim notifikasi ke user
            $this->notificationService->send(
                $order->user_id,
                'Pembayaran Diterima',
                "Pembayaran untuk pesanan #{$order->id} telah diterima",
                'payment_received',
                ['order_id' => $order->id, 'payment_id' => $payment->id]
            );

            return $payment;
        } catch (\Exception $e) {
            Log::error('Payment Error: ' . $e->getMessage());
            throw $e;
        }
    }

    public function handleWebhook($payload)
    {
        try {
            // Implementasi penanganan webhook dari payment gateway
            $payment = Payment::where('payment_details->transaction_id', $payload['transaction_id'])
                ->firstOrFail();

            $payment->update([
                'status' => $this->mapPaymentStatus($payload['status']),
                'payment_details' => array_merge($payment->payment_details, $payload)
            ]);

            if ($payment->status === 'completed') {
                $order = $payment->order;
                $order->update(['status' => 'paid']);

                // Kirim notifikasi ke user
                $this->notificationService->send(
                    $order->user_id,
                    'Pembayaran Berhasil',
                    "Pembayaran untuk pesanan #{$order->id} telah berhasil",
                    'payment_success',
                    ['order_id' => $order->id]
                );
            }

            return $payment;
        } catch (\Exception $e) {
            Log::error('Webhook Error: ' . $e->getMessage());
            throw $e;
        }
    }

    protected function processPaymentGateway($order, $paymentMethod)
    {
        // Implementasi sesuai payment gateway yang digunakan
        // Contoh implementasi dummy
        return [
            'transaction_id' => uniqid('TRX'),
            'payment_url' => 'https://payment-gateway.com/pay/' . uniqid('TRX'),
            'expired_at' => now()->addDay()
        ];
    }

    protected function mapPaymentStatus($gatewayStatus)
    {
        $statusMap = [
            'success' => 'completed',
            'pending' => 'pending',
            'failed' => 'failed',
            'expired' => 'expired'
        ];

        return $statusMap[$gatewayStatus] ?? 'pending';
    }
} 