import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    String path = join(await getDatabasesPath(), 'hostel_management.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE members (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        balance REAL,
        contactInfo TEXT,
        paymentHistory TEXT,
        foodPreferences TEXT,
        attendance TEXT,
        profilePicture TEXT,
        totalDeposited REAL,
        totalFoodConsumed REAL,
        description TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        breakfast INTEGER,
        lunch INTEGER,
        dinner INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE market_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        category TEXT,
        price REAL,
        date TEXT
      )
    ''');
  }
}

