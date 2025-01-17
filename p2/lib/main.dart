import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckboxExample(),
    );
  }
}

enum Category {
  category1,
  category2,

}

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  // A map to hold the selected state of each category
  Map<Category, bool> _selectedCategories = {
    Category.category1: false,
    Category.category2: false,
  };

  // Function to handle checkbox changes
  void _onCategoryChanged(Category category, bool? isSelected) {
    setState(() {
      _selectedCategories[category] = isSelected ?? false;
    });
  }

  // Function to get selected categories
  List<Category> _getSelectedCategories() {
    return _selectedCategories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: Category.values.map((category) {
              return Row(
                children: [
                  Checkbox(
                    value: _selectedCategories[category],
                    onChanged: (bool? isSelected) {
                      _onCategoryChanged(category, isSelected);
                    },
                  ),
                  Text(category.toString().split('.').last),
                ],
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              List<Category> selectedCategories = _getSelectedCategories();
              // Here you can save or use the selected categories
              print('Selected Categories: $selectedCategories');
            },
            child: Text('Save Selected Categories'),
          ),
        ],
      ),
    );
  }
}