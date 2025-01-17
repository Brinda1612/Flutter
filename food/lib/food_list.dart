import 'package:flutter/material.dart';
import 'package:food/food_item.dart';

import 'Model/food_m.dart';

class foodList extends StatelessWidget {
  const foodList({
    super.key,
    required this.food,
    required this.onRemoveExpense,
  });

  final void Function(Food food) onRemoveExpense;

  final List<Food> food;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: food.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error,
            ),
            key: ValueKey(food[index]),
            onDismissed: (direction) {
              onRemoveExpense(food[index]);
            },
            child: FoodItem(
              food[index],
            )));
  }
}
