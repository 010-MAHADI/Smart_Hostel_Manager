import 'package:flutter/material.dart';
import 'member_screen.dart';
import 'meal_screen.dart';
import 'market_screen.dart';
import 'summary_screen.dart';
import 'data_backup_screen.dart';  // Add this import

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hostel Management')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemberScreen()),
                );
              },
              child: Text('Members'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealScreen()),
                );
              },
              child: Text('Meals'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MarketScreen()),
                );
              },
              child: Text('Market'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SummaryScreen()),
                );
              },
              child: Text('Summary'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/backup');
              },
              child: Text('Backup & Restore'),
            ),
          ],
        ),
      ),
    );
  }
}

