<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        $categories = [
            [
                'name' => 'Elektronik',
                'description' => 'Produk elektronik seperti smartphone, laptop, dan gadget lainnya',
                'is_active' => true,
            ],
            [
                'name' => 'Fashion',
                'description' => 'Pakaian, sepatu, dan aksesoris fashion',
                'is_active' => true,
            ],
            [
                'name' => 'Kesehatan',
                'description' => 'Produk kesehatan dan kecantikan',
                'is_active' => true,
            ],
            [
                'name' => 'Rumah Tangga',
                'description' => 'Peralatan dan perlengkapan rumah tangga',
                'is_active' => true,
            ],
        ];

        foreach ($categories as $category) {
            Category::create([
                'name' => $category['name'],
                'slug' => Str::slug($category['name']),
                'description' => $category['description'],
                'is_active' => $category['is_active'],
            ]);
        }
    }
} 