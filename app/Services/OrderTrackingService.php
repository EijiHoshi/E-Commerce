<?php

namespace App\Services;

use App\Models\Order;
use App\Models\OrderTracking;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class OrderTrackingService
{
    protected $notificationService;

    public function __construct(NotificationService $notificationService)
    {
        $this->notificationService = $notificationService;
    }

    public function updateTracking(Order $order, $status, $description, $location = null, $metadata = null)
    {
        $tracking = OrderTracking::create([
            'order_id' => $order->id,
            'status' => $status,
            'description' => $description,
            'location' => $location,
            'metadata' => $metadata
        ]);

        // Update status order
        $order->update(['status' => $status]);

        // Kirim notifikasi ke user
        $this->notificationService->send(
            $order->user_id,
            'Update Status Pesanan',
            "Pesanan #{$order->id}: {$description}",
            'order_status_update',
            [
                'order_id' => $order->id,
                'status' => $status,
                'tracking_id' => $tracking->id
            ]
        );

        return $tracking;
    }

    public function getTrackingHistory(Order $order)
    {
        return OrderTracking::where('order_id', $order->id)
            ->orderBy('created_at', 'desc')
            ->get();
    }

    public function syncWithShippingProvider(Order $order)
    {
        try {
            // Implementasi integrasi dengan provider pengiriman
            // Contoh implementasi dummy
            $response = [
                'status' => 'in_transit',
                'description' => 'Paket sedang dalam perjalanan',
                'location' => 'Jakarta Pusat',
                'metadata' => [
                    'tracking_number' => 'JNE123456789',
                    'estimated_delivery' => now()->addDays(2)
                ]
            ];

            return $this->updateTracking(
                $order,
                $response['status'],
                $response['description'],
                $response['location'],
                $response['metadata']
            );
        } catch (\Exception $e) {
            Log::error('Shipping Provider Sync Error: ' . $e->getMessage());
            throw $e;
        }
    }
} 