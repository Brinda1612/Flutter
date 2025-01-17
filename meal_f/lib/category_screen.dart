
import 'package:flutter/material.dart';

import 'category_gridItem.dart';
import 'category_m.dart';
import 'dummy_data.dart';
import 'meal.dart';
import 'meal_screen.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key, required this.onFavorite});

  final void Function(Meal meal) onFavorite;


  void selectedCategory(BuildContext context, Category categorys){
   final filterMeals = dummyMeals.where((meal) => meal.categories.contains(categorys.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder:
        (ctx) => Mealscreen(
          title: categorys.title,
          meals: filterMeals, onFavorite: onFavorite,
        )
    )
    );
  }

  @override
  Widget build(BuildContext context) {

    return  GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),
        children: [
          // Text('1')
          for(final category in availableCategories)
            Categorygriditem(
              category: category,
              onSelectedCategory: () {
                selectedCategory(context, category);
              },
            )
        ],
    );
  }
}
