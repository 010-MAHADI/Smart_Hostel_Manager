// lib/screens/data_backup_screen.dart
import 'package:flutter/material.dart';
import '../services/backup_service.dart';

class DataBackupScreen extends StatelessWidget {
  final BackupService _backupService = BackupService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Backup & Restore')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Example data to backup
                Map<String, dynamic> memberData = {
                  'id': 1,
                  'name': 'John Doe',
                  'balance': 100.0,
                };
                await _backupService.backupData('member_1', memberData);
              },
              child: Text('Backup Data'),
            ),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> restoredData = await _backupService.restoreData('member_1');
                print('Restored Data: $restoredData');
              },
              child: Text('Restore Data'),
            ),
          ],
        ),
      ),
    );
  }
}
