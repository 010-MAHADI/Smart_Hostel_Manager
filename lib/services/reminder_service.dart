// lib/services/reminder_service.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification_service.dart';

class ReminderService {
  final NotificationService _notificationService = NotificationService();

  Future<void> schedulePaymentReminder() async {
    await _notificationService.showNotification(
        0, 'Payment Reminder', 'You have pending payments. Please settle your balance.');
  }

  Future<void> scheduleMealReminder() async {
    await _notificationService.showNotification(
        1, 'Meal Reminder', 'Don’t forget to mark your meals for today.');
  }
}
