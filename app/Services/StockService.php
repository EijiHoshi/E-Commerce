<?php

namespace App\Services;

use App\Models\Product;
use App\Services\NotificationService;
use Illuminate\Support\Facades\DB;

class StockService
{
    protected $notificationService;

    public function __construct(NotificationService $notificationService)
    {
        $this->notificationService = $notificationService;
    }

    public function updateStock($productId, $quantity, $type = 'add')
    {
        return DB::transaction(function () use ($productId, $quantity, $type) {
            $product = Product::findOrFail($productId);
            
            if (!$product->track_stock) {
                return $product;
            }

            $oldStock = $product->stock;
            $newStock = $type === 'add' ? $oldStock + $quantity : $oldStock - $quantity;

            if ($newStock < 0) {
                throw new \Exception('Stok tidak mencukupi');
            }

            $product->update(['stock' => $newStock]);

            // Cek stok minimum
            if ($newStock <= $product->minimum_stock) {
                $this->notificationService->send(
                    $product->user_id,
                    'Stok Menipis',
                    "Stok produk {$product->name} sudah mencapai batas minimum ({$product->minimum_stock})",
                    'low_stock',
                    ['product_id' => $product->id, 'current_stock' => $newStock]
                );
            }

            return $product;
        });
    }

    public function checkStock($productId, $quantity)
    {
        $product = Product::findOrFail($productId);
        
        if (!$product->track_stock) {
            return true;
        }

        return $product->stock >= $quantity;
    }

    public function getLowStockProducts()
    {
        return Product::where('track_stock', true)
            ->whereRaw('stock <= minimum_stock')
            ->get();
    }
} 