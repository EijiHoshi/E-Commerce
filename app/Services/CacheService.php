<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;

class CacheService
{
    const CACHE_TTL = 3600; // 1 jam

    public function remember($key, $callback, $ttl = null)
    {
        return Cache::remember($key, $ttl ?? self::CACHE_TTL, $callback);
    }

    public function forget($key)
    {
        return Cache::forget($key);
    }

    public function flush()
    {
        return Cache::flush();
    }

    // Cache keys
    public static function getProductKey($id)
    {
        return "product:{$id}";
    }

    public static function getCategoryKey($id)
    {
        return "category:{$id}";
    }

    public static function getProductsByCategoryKey($categoryId)
    {
        return "category:{$categoryId}:products";
    }

    public static function getPopularProductsKey()
    {
        return "products:popular";
    }

    public static function getNewArrivalsKey()
    {
        return "products:new-arrivals";
    }
} 