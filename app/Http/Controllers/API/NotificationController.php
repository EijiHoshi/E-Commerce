<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Services\NotificationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    protected $notificationService;

    public function __construct(NotificationService $notificationService)
    {
        $this->notificationService = $notificationService;
    }

    public function index()
    {
        $notifications = $this->notificationService->getUserNotifications(Auth::id());
        return response()->json($notifications);
    }

    public function markAsRead($id)
    {
        $notification = $this->notificationService->markAsRead($id);
        return response()->json([
            'message' => 'Notifikasi ditandai sebagai telah dibaca',
            'data' => $notification
        ]);
    }

    public function markAllAsRead()
    {
        $this->notificationService->markAllAsRead(Auth::id());
        return response()->json([
            'message' => 'Semua notifikasi ditandai sebagai telah dibaca'
        ]);
    }

    public function getUnreadCount()
    {
        $count = $this->notificationService->getUnreadCount(Auth::id());
        return response()->json(['count' => $count]);
    }
} 