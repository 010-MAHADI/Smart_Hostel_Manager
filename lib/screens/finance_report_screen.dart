// lib/screens/finance_report_screen.dart
import 'package:flutter/material.dart';

class FinanceReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finance Report')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Market Cost: \$1000'),
            Text('Remaining Money: \$200'),
            Text('Food Rate per Meal: \$5'),
            // Add more finance-related info here
          ],
        ),
      ),
    );
  }
}
