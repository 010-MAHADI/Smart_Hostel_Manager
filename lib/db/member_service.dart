import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/member.dart';
import 'db_helper.dart';

class MemberService {
  DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Member>> getMembers() async {
    final db = await _dbHelper.db;
    final List<Map<String, dynamic>> maps = await db.query('members');
    return List.generate(maps.length, (i) {
      return Member.fromMap(maps[i]);
    });
  }

  Future<void> insertMember(Member member) async {
    final db = await _dbHelper.db;
    await db.insert('members', member.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Add other methods for updating, deleting members
}
