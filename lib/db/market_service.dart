import 'package:sqflite/sqflite.dart';
import '../models/market.dart';
import 'db_helper.dart';

class MarketService {
  DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<MarketItem>> getMarketItems() async {
    final db = await _dbHelper.db;
    final List<Map<String, dynamic>> maps = await db.query('market_items');
    return List.generate(maps.length, (i) {
      return MarketItem.fromMap(maps[i]);
    });
  }

  Future<void> insertMarketItem(MarketItem marketItem) async {
    final db = await _dbHelper.db;
    await db.insert('market_items', marketItem.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Add other methods for updating, deleting market items as needed
}
