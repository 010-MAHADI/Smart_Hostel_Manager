// lib/models/meal.dart
class Meal {
  int id;
  String date;
  bool breakfast;
  bool lunch;
  bool dinner;

  Meal({this.id, this.date, this.breakfast, this.lunch, this.dinner});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'breakfast': breakfast ? 1 : 0,
      'lunch': lunch ? 1 : 0,
      'dinner': dinner ? 1 : 0,
    };
  }

  Meal.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    date = map['date'];
    breakfast = map['breakfast'] == 1;
    lunch = map['lunch'] == 1;
    dinner = map['dinner'] == 1;
  }
}

// lib/db/meal_service.dart
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
