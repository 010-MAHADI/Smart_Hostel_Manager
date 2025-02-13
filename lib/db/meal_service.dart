import 'package:sqflite/sqflite.dart';
import '../models/meal.dart';
import 'db_helper.dart';

class MealService {
  DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Meal>> getMeals() async {
    final db = await _dbHelper.db;
    final List<Map<String, dynamic>> maps = await db.query('meals');
    return List.generate(maps.length, (i) {
      return Meal.fromMap(maps[i]);
    });
  }

  Future<void> insertMeal(Meal meal) async {
    final db = await _dbHelper.db;
    await db.insert('meals', meal.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Add other methods for updating, deleting meals
}
