<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\Admin\BannerController;
use App\Http\Controllers\Admin\RecommendationController;
use App\Http\Controllers\Public\PublicController;
use App\Http\Controllers\API\ProductReviewController;
use App\Http\Controllers\API\NotificationController;
use App\Http\Controllers\API\StockController;
use App\Http\Controllers\API\PaymentController;
use App\Http\Controllers\API\WishlistController;
use App\Http\Controllers\API\OrderTrackingController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\Auth\VerifyEmailController;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// 🔐 AUTH
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/forgot-password', [PasswordResetLinkController::class, 'store']);
Route::post('/reset-password', [NewPasswordController::class, 'store']);

// Email Verification Routes
Route::post('/email/verify', [VerifyEmailController::class, 'verify']);
Route::post('/email/resend', [VerifyEmailController::class, 'resend']);
Route::post('/send-verification-email', [AuthController::class, 'sendVerificationEmail']);

Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/user/profile', function (Request $request) {
    $user = $request->user();
    return response()->json([
        'name' => $user->name,
        'photo' => $user->photo ?? '', // pastikan field photo ada di tabel users
        // tambahkan field lain jika perlu
    ]);
});

// 🌐 PUBLIC ROUTES (Homepage / User tidak login)
Route::get('/homepage', [PublicController::class, 'homepage']); // berisi banner, kategori, rekomendasi, popular, dan produk
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/{id}', [ProductController::class, 'show']);
Route::get('/categories', [CategoryController::class, 'index']);
Route::get('/categories/{id}', [CategoryController::class, 'show']);

//Harus butuh login
Route::middleware('auth:sanctum')->group(function () {

    //🛒 USER CART 
    Route::get('/cart', [CartController::class, 'index']);
    Route::post('/cart/add', [CartController::class, 'addItem']);
    Route::put('/cart/update/{id}', [CartController::class, 'update']);
    Route::delete('/cart/remove/{id}', [CartController::class, 'destroy']);

    //📍 ADDRESSES
    Route::get('/addresses', [\App\Http\Controllers\API\AddressController::class, 'index']);
    Route::post('/addresses', [\App\Http\Controllers\API\AddressController::class, 'store']);
    Route::put('/addresses/{id}', [\App\Http\Controllers\API\AddressController::class, 'update']);
    Route::delete('/addresses/{id}', [\App\Http\Controllers\API\AddressController::class, 'destroy']);

    //Checkout Produk
    Route::post('/checkout', [\App\Http\Controllers\API\OrderController::class, 'checkout']);
    Route::get('/orders', [\App\Http\Controllers\API\OrderController::class, 'index']);
    Route::get('/orders/{id}', [\App\Http\Controllers\API\OrderController::class, 'show']);
    Route::put('/orders/{id}/status', [\App\Http\Controllers\API\OrderController::class, 'updateStatus']);
    Route::post('/orders/{id}/cancel', [\App\Http\Controllers\API\OrderController::class, 'cancel']);

    // Product Review Routes
    Route::post('/products/{product}/reviews', [ProductReviewController::class, 'store']);
    Route::get('/products/{product}/reviews', [ProductReviewController::class, 'index']);

    // Notification Routes
    Route::get('/notifications', [NotificationController::class, 'index']);
    Route::post('/notifications/{id}/read', [NotificationController::class, 'markAsRead']);
    Route::post('/notifications/read-all', [NotificationController::class, 'markAllAsRead']);
    Route::get('/notifications/unread-count', [NotificationController::class, 'getUnreadCount']);

    // Stock Management Routes
    Route::middleware(['auth:sanctum', 'admin'])->group(function () {
        Route::post('/products/{product}/stock', [StockController::class, 'updateStock']);
        Route::get('/products/low-stock', [StockController::class, 'getLowStockProducts']);
    });

    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/products/{product}/check-stock', [StockController::class, 'checkStock']);
    });

    // Payment Routes
    Route::get('/payment-methods', [PaymentController::class, 'getPaymentMethods']);
    Route::post('/orders/{order}/payment', [PaymentController::class, 'createPayment']);

    // 🔐 ADMIN ROUTES
    Route::middleware('admin')->group(function () {
        // Produk & Kategori
        Route::apiResource('products', ProductController::class)->except(['index', 'show']);
        Route::apiResource('categories', CategoryController::class)->except(['index', 'show']);

        // Ubah status 
        Route::put('/orders/{id}/status', [\App\Http\Controllers\API\OrderController::class, 'updateStatus']);

        // Banner
        Route::prefix('admin')->group(function () {
            Route::get('banner', [BannerController::class, 'index']);
            Route::post('banner', [BannerController::class, 'store']);
            Route::get('banner/{id}', [BannerController::class, 'show']);
            Route::put('banner/{id}', [BannerController::class, 'update']);
            Route::delete('banner/{id}', [BannerController::class, 'destroy']);

            // Rekomendasi Produk
            Route::get('recommendations', [RecommendationController::class, 'index']);
            Route::post('recommendations', [RecommendationController::class, 'store']);
            Route::delete('recommendations/{product}', [RecommendationController::class, 'destroy']);
        });
    });

    // Wishlist Routes
    Route::get('/wishlist', [WishlistController::class, 'index']);
    Route::post('/wishlist', [WishlistController::class, 'store']);
    Route::delete('/wishlist/{id}', [WishlistController::class, 'destroy']);
    Route::get('/wishlist/check-availability', [WishlistController::class, 'checkProductAvailability']);

    // Order Tracking Routes
    Route::get('/orders/{order}/tracking', [OrderTrackingController::class, 'getTracking']);
    Route::post('/orders/{order}/tracking', [OrderTrackingController::class, 'updateTracking']);
    Route::post('/orders/{order}/tracking/sync', [OrderTrackingController::class, 'syncWithShippingProvider']);
});

// Payment Webhook Route (tidak perlu auth karena dipanggil oleh payment gateway)
Route::post('/payment/webhook', [PaymentController::class, 'handleWebhook']);

// Route untuk mengecek data gambar
Route::get('/check-images', function () {
    return response()->json([
        'products' => DB::table('products')->select('id', 'name', 'image')->get(),
        'categories' => DB::table('categories')->select('id', 'name', 'image')->get(),
        'banners' => DB::table('banners')->select('id', 'title', 'image')->get()
    ]);
});

// Route untuk mengecek ketersediaan gambar
Route::get('/check-image/{type}/{filename}', function ($type, $filename) {
    $path = public_path("images/{$type}/{$filename}");
    if (file_exists($path)) {
        return response()->json([
            'status' => 'success',
            'message' => 'File ditemukan',
            'path' => "images/{$type}/{$filename}",
            'size' => filesize($path),
            'url' => url("images/{$type}/{$filename}")
        ]);
    }
    return response()->json([
        'status' => 'error',
        'message' => 'File tidak ditemukan',
        'path' => "images/{$type}/{$filename}"
    ], 404);
});
