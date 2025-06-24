<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UpdateImagesSeeder extends Seeder
{
    public function run()
    {
        // Update gambar produk
        DB::table('products')->where('id', 1)->update(['image' => 'images/products/smartphone-x.jpg']);
        DB::table('products')->where('id', 2)->update(['image' => 'images/products/laptop-pro.jpg']);
        DB::table('products')->where('id', 3)->update(['image' => 'images/products/kemeja-casual.jpg']);

        // Update gambar kategori
        DB::table('categories')->where('id', 1)->update(['image' => 'images/categories/elektronik.jpg']);
        DB::table('categories')->where('id', 2)->update(['image' => 'images/categories/fashion.jpg']);
        DB::table('categories')->where('id', 3)->update(['image' => 'images/categories/kesehatan.jpg']);
        DB::table('categories')->where('id', 4)->update(['image' => 'images/categories/rumah-tangga.jpg']);

        // Update gambar banner
        DB::table('banners')->where('id', 1)->update(['image' => 'images/banners/promo-akhir-tahun.jpg']);
        DB::table('banners')->where('id', 2)->update(['image' => 'images/banners/produk-terbaru.jpg']);
    }
} 