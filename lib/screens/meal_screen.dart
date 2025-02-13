// lib/screens/meal_screen.dart
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_service.dart';

class MealScreen extends StatefulWidget {
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final MealService _mealService = MealService();
  List<Meal> _meals = [];

  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  Future<void> _fetchMeals() async {
    List<Meal> meals = await _mealService.getMeals();
    setState(() {
      _meals = meals;
    });
  }

  void _addMeal() {
    // Code to add a new meal entry
  }

  void _addGuestMeal() {
    // Code to add a guest meal entry
  }

  void _generateMonthlyReport() {
    // Code to generate monthly report
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meals')),
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (context, index) {
          final meal = _meals[index];
          return ListTile(
            title: Text('Date: ${meal.date}'),
            subtitle: Text('Breakfast: ${meal.breakfast}, Lunch: ${meal.lunch}, Dinner: ${meal.dinner}'),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _addMeal,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _addGuestMeal,
            child: Icon(Icons.person_add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _generateMonthlyReport,
            child: Icon(Icons.bar_chart),
          ),
        ],
      ),
    );
  }
}
