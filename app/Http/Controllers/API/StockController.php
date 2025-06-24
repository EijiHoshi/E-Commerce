<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Services\StockService;
use Illuminate\Http\Request;

class StockController extends Controller
{
    protected $stockService;

    public function __construct(StockService $stockService)
    {
        $this->stockService = $stockService;
    }

    public function updateStock(Request $request, $productId)
    {
        $request->validate([
            'quantity' => 'required|integer|min:1',
            'type' => 'required|in:add,subtract'
        ]);

        try {
            $product = $this->stockService->updateStock(
                $productId,
                $request->quantity,
                $request->type
            );

            return response()->json([
                'message' => 'Stok berhasil diperbarui',
                'data' => $product
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => $e->getMessage()
            ], 400);
        }
    }

    public function checkStock(Request $request, $productId)
    {
        $request->validate([
            'quantity' => 'required|integer|min:1'
        ]);

        $isAvailable = $this->stockService->checkStock($productId, $request->quantity);

        return response()->json([
            'available' => $isAvailable
        ]);
    }

    public function getLowStockProducts()
    {
        $products = $this->stockService->getLowStockProducts();
        return response()->json($products);
    }
} 