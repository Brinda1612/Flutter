import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/Dummy_data.dart';
import 'package:meals/Category_m.dart';
import 'package:meals/MealScreen.dart';
import 'package:meals/CategoryGridItem.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

  void selectedCategory(BuildContext context, Category categorys){
   final filterMeals = dummyMeals.where((meal) => meal.categories.contains(categorys.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder:
        (ctx) => Mealscreen(
          title: categorys.title,
          meals: filterMeals,
        )
    )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
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
            },)
        ],
      ),
    );
  }
}
