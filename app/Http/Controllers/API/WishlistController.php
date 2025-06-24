<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Wishlist;
use App\Services\NotificationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WishlistController extends Controller
{
    protected $notificationService;

    public function __construct(NotificationService $notificationService)
    {
        $this->notificationService = $notificationService;
    }

    public function index()
    {
        $wishlists = Wishlist::with('product')
            ->where('user_id', Auth::id())
            ->latest()
            ->paginate(10);

        return response()->json($wishlists);
    }

    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id'
        ]);

        try {
            $wishlist = Wishlist::create([
                'user_id' => Auth::id(),
                'product_id' => $request->product_id
            ]);

            return response()->json([
                'message' => 'Produk berhasil ditambahkan ke wishlist',
                'data' => $wishlist->load('product')
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Produk sudah ada di wishlist'
            ], 400);
        }
    }

    public function destroy($id)
    {
        $wishlist = Wishlist::where('user_id', Auth::id())
            ->where('id', $id)
            ->firstOrFail();

        $wishlist->delete();

        return response()->json([
            'message' => 'Produk berhasil dihapus dari wishlist'
        ]);
    }

    public function checkProductAvailability()
    {
        $wishlists = Wishlist::with('product')
            ->where('user_id', Auth::id())
            ->get();

        foreach ($wishlists as $wishlist) {
            if ($wishlist->product->stock > 0) {
                $this->notificationService->send(
                    Auth::id(),
                    'Produk Tersedia',
                    "Produk {$wishlist->product->name} sudah tersedia di toko kami",
                    'product_available',
                    ['product_id' => $wishlist->product->id]
                );
            }
        }

        return response()->json([
            'message' => 'Pengecekan ketersediaan produk selesai'
        ]);
    }
} 