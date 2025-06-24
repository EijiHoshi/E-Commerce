<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;

class LogService
{
    public function logActivity($userId, $action, $description, $metadata = [])
    {
        Log::channel('activity')->info('User Activity', [
            'user_id' => $userId,
            'action' => $action,
            'description' => $description,
            'metadata' => $metadata,
            'timestamp' => now()
        ]);
    }

    public function logError($message, $context = [])
    {
        Log::channel('error')->error($message, array_merge($context, [
            'timestamp' => now()
        ]));
    }

    public function logPayment($paymentId, $status, $metadata = [])
    {
        Log::channel('payment')->info('Payment Activity', [
            'payment_id' => $paymentId,
            'status' => $status,
            'metadata' => $metadata,
            'timestamp' => now()
        ]);
    }

    public function logOrder($orderId, $action, $metadata = [])
    {
        Log::channel('order')->info('Order Activity', [
            'order_id' => $orderId,
            'action' => $action,
            'metadata' => $metadata,
            'timestamp' => now()
        ]);
    }

    public function logProduct($productId, $action, $metadata = [])
    {
        Log::channel('product')->info('Product Activity', [
            'product_id' => $productId,
            'action' => $action,
            'metadata' => $metadata,
            'timestamp' => now()
        ]);
    }
} 