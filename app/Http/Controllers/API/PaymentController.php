<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\PaymentMethod;
use App\Services\PaymentService;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    protected $paymentService;

    public function __construct(PaymentService $paymentService)
    {
        $this->paymentService = $paymentService;
    }

    public function createPayment(Request $request, $orderId)
    {
        $request->validate([
            'payment_method_id' => 'required|exists:payment_methods,id'
        ]);

        $order = Order::findOrFail($orderId);
        $paymentMethod = PaymentMethod::findOrFail($request->payment_method_id);

        try {
            $payment = $this->paymentService->createPayment($order, $paymentMethod);
            return response()->json([
                'message' => 'Pembayaran berhasil dibuat',
                'data' => $payment
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Gagal membuat pembayaran: ' . $e->getMessage()
            ], 400);
        }
    }

    public function handleWebhook(Request $request)
    {
        try {
            $payment = $this->paymentService->handleWebhook($request->all());
            return response()->json([
                'message' => 'Webhook berhasil diproses',
                'data' => $payment
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Gagal memproses webhook: ' . $e->getMessage()
            ], 400);
        }
    }

    public function getPaymentMethods()
    {
        $paymentMethods = PaymentMethod::where('is_active', true)->get();
        return response()->json($paymentMethods);
    }

    /**
     * Upload bukti transfer pembayaran (manual payment)
     */
    public function uploadProofOfPayment(Request $request, $paymentId)
    {
        $request->validate([
            'proof_of_payment' => 'required|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        $payment = \App\Models\Payment::findOrFail($paymentId);

        // Simpan file ke storage/app/public/payments
        $file = $request->file('proof_of_payment');
        $path = $file->store('payments', 'public');

        // Update kolom proof_of_payment
        $payment->proof_of_payment = $path;
        $payment->save();

        return response()->json([
            'message' => 'Bukti transfer berhasil diupload',
            'proof_of_payment_url' => asset('storage/' . $path),
            'data' => $payment
        ]);
    }
} 