<?php

namespace App\Services;

use App\Models\Notification;
use App\Models\User;

class NotificationService
{
    public function send($userId, $title, $message, $type, $data = null)
    {
        return Notification::create([
            'user_id' => $userId,
            'title' => $title,
            'message' => $message,
            'type' => $type,
            'data' => $data
        ]);
    }

    public function sendToAll($title, $message, $type, $data = null)
    {
        $users = User::all();
        $notifications = [];

        foreach ($users as $user) {
            $notifications[] = $this->send($user->id, $title, $message, $type, $data);
        }

        return $notifications;
    }

    public function markAsRead($notificationId)
    {
        $notification = Notification::findOrFail($notificationId);
        $notification->update(['status' => 'read']);
        return $notification;
    }

    public function markAllAsRead($userId)
    {
        return Notification::where('user_id', $userId)
            ->where('status', 'unread')
            ->update(['status' => 'read']);
    }

    public function getUserNotifications($userId, $limit = 10)
    {
        return Notification::where('user_id', $userId)
            ->latest()
            ->paginate($limit);
    }

    public function getUnreadCount($userId)
    {
        return Notification::where('user_id', $userId)
            ->where('status', 'unread')
            ->count();
    }
} 