<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    // Get all products
    public function index(Request $request)
    {
        if ($request->has('category')) {
            $category = $request->input('category');
            $products = Product::with('category')
                ->whereHas('category', function($q) use ($category) {
                    $q->where('name', $category)->orWhere('slug', $category);
                })
                ->get();
        } else {
            $products = Product::with('category')->get();
        }
        return response()->json($products);
    }

    // Store new product
    public function store(Request $request)
    {
        $request->validate([
            'category_id' => 'required|exists:categories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|integer', // ✅ tambahkan ini
            'image' => 'nullable|string',
            'is_recommended' => 'boolean'
        ]);

        $product = Product::create([
            'name' => $request->name,
            'description' => $request->description,
            'price' => $request->price,
            'stock' => $request->stock, // pastikan ini dikirim
            'category_id' => $request->category_id,
            'is_recommended' => $request->is_recommended ?? false,
        ]);

        return response()->json($product, 201);
    }


    // Get one product
    public function show($id)
    {
        $product = Product::with('category')->findOrFail($id);
        return response()->json($product);
    }

    // Update product
    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);

        $request->validate([
            'category_id' => 'required|exists:categories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'image' => 'nullable|string',
            'is_recommended' => 'boolean'
        ]);

        $product->update($request->all());

        return response()->json($product);
    }

    // Delete product
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();

        return response()->json(['message' => 'Product deleted']);
    }

    //Rekomendasi Product
    public function recommended()
    {
        $recommended = Product::where('is_recommended', true)->take(6)->get();

        return response()->json([
            'recommended' => $recommended
        ]);
    }
}
