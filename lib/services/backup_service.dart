// lib/services/backup_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BackupService {
  Future<void> backupData(String key, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(data));
  }

  Future<Map<String, dynamic>> restoreData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonData = prefs.getString(key);
    return jsonData != null ? json.decode(jsonData) : null;
  }
}
