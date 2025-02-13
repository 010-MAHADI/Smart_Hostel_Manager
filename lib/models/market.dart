// lib/models/market.dart
class MarketItem {
  int id;
  String name;
  String category;
  double price;
  String date;

  MarketItem({this.id, this.name, this.category, this.price, this.date});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'date': date,
    };
  }

  MarketItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    category = map['category'];
    price = map['price'];
    date = map['date'];
  }
}

// lib/db/market_service.dart
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

  // Add other methods for updating, deleting market items
}
