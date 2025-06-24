<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Services\OrderTrackingService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderTrackingController extends Controller
{
    protected $trackingService;

    public function __construct(OrderTrackingService $trackingService)
    {
        $this->trackingService = $trackingService;
    }

    public function getTracking($orderId)
    {
        $order = Order::where('user_id', Auth::id())
            ->findOrFail($orderId);

        $tracking = $this->trackingService->getTrackingHistory($order);
        return response()->json($tracking);
    }

    public function updateTracking(Request $request, $orderId)
    {
        $request->validate([
            'status' => 'required|string',
            'description' => 'required|string',
            'location' => 'nullable|string',
            'metadata' => 'nullable|array'
        ]);

        $order = Order::where('user_id', Auth::id())
            ->findOrFail($orderId);

        $tracking = $this->trackingService->updateTracking(
            $order,
            $request->status,
            $request->description,
            $request->location,
            $request->metadata
        );

        return response()->json([
            'message' => 'Status pesanan berhasil diperbarui',
            'data' => $tracking
        ]);
    }

    public function syncWithShippingProvider($orderId)
    {
        $order = Order::where('user_id', Auth::id())
            ->findOrFail($orderId);

        try {
            $tracking = $this->trackingService->syncWithShippingProvider($order);
            return response()->json([
                'message' => 'Status pengiriman berhasil disinkronkan',
                'data' => $tracking
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Gagal menyinkronkan status pengiriman: ' . $e->getMessage()
            ], 400);
        }
    }
}