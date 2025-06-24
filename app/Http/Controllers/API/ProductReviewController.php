<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\ProductReview;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductReviewController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'required|string|min:10'
        ]);

        $review = ProductReview::create([
            'user_id' => Auth::id(),
            'product_id' => $request->product_id,
            'rating' => $request->rating,
            'comment' => $request->comment,
            'is_verified_purchase' => $this->checkVerifiedPurchase($request->product_id)
        ]);

        return response()->json([
            'message' => 'Review berhasil ditambahkan',
            'data' => $review
        ], 201);
    }

    public function index($productId)
    {
        $reviews = ProductReview::with('user')
            ->where('product_id', $productId)
            ->latest()
            ->paginate(10);

        return response()->json($reviews);
    }

    private function checkVerifiedPurchase($productId)
    {
        // Implementasi logika untuk mengecek apakah user sudah membeli produk
        return Auth::user()->orders()
            ->whereHas('orderItems', function ($query) use ($productId) {
                $query->where('product_id', $productId);
            })
            ->where('status', 'completed')
            ->exists();
    }
} 