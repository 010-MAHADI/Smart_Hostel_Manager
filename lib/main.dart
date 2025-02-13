import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/data_backup_screen.dart';
import 'providers/theme_provider.dart';
import 'services/notification_service.dart';
import 'services/reminder_service.dart';

void main() {
  runApp(MyApp());

  final NotificationService notificationService = NotificationService();
  notificationService.init();

  final ReminderService reminderService = ReminderService();
  reminderService.schedulePaymentReminder();
  reminderService.scheduleMealReminder();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: HomeScreen(),
            routes: {
              '/backup': (context) => DataBackupScreen(),
            },
          );
        },
      ),
    );
  }
}
