<?php

namespace Database\Seeders;

use App\Models\Banner;
use Illuminate\Database\Seeder;

class BannerSeeder extends Seeder
{
    public function run(): void
    {
        $banners = [
            [
                'title' => 'Promo Akhir Tahun',
                'image' => 'banners/promo-akhir-tahun.jpg',
                'link' => '/promo/akhir-tahun',
            ],
            [
                'title' => 'Produk Terbaru',
                'image' => 'banners/produk-terbaru.jpg',
                'link' => '/produk/terbaru',
            ],
        ];

        foreach ($banners as $banner) {
            Banner::create($banner);
        }
    }
} 