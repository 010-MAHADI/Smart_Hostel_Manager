// lib/screens/market_screen.dart
import 'package:flutter/material.dart';
import '../models/market.dart';
import '../services/market_service.dart';

class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final MarketService _marketService = MarketService();
  List<MarketItem> _marketItems = [];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _fetchMarketItems();
  }

  Future<void> _fetchMarketItems() async {
    List<MarketItem> marketItems = await _marketService.getMarketItems();
    setState(() {
      _marketItems = marketItems;
    });
  }

  void _filterItems(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MarketItem> filteredItems = _selectedCategory == 'All'
        ? _marketItems
        : _marketItems.where((item) => item.category == _selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Market'),
        actions: [
          DropdownButton<String>(
            value: _selectedCategory,
            items: <String>['All', 'Groceries', 'Utilities', 'Rice', 'Vegetables', 'Gas', 'Scaffolding']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: _filterItems,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Category: ${item.category}, Price: ${item.price}, Date: ${item.date}'),
          );
        },
      ),
    );
  }
}
