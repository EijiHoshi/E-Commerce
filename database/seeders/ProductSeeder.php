<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $products = [
            [
                'name' => 'Smartphone X',
                'description' => 'Smartphone terbaru dengan kamera 108MP',
                'price' => 5000000,
                'stock' => 50,
                'minimum_stock' => 5,
                'track_stock' => true,
                'category_id' => 1, // Elektronik
                'is_recommended' => true,
            ],
            [
                'name' => 'Laptop Pro',
                'description' => 'Laptop performa tinggi untuk gaming dan kerja',
                'price' => 15000000,
                'stock' => 20,
                'minimum_stock' => 3,
                'track_stock' => true,
                'category_id' => 1, // Elektronik
                'is_recommended' => true,
            ],
            [
                'name' => 'Kemeja Casual',
                'description' => 'Kemeja casual nyaman untuk sehari-hari',
                'price' => 250000,
                'stock' => 100,
                'minimum_stock' => 10,
                'track_stock' => true,
                'category_id' => 2, // Fashion
                'is_recommended' => false,
            ],
        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
}
