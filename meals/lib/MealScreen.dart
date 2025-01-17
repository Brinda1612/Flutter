import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/meal.dart';
import 'package:meals/Meal_Details.dart';
import 'package:meals/MealItem.dart';

class Mealscreen extends StatelessWidget {
  const Mealscreen({super.key, required this.title, required this.meals});

  final String title;
final List<Meal> meals;

void selectMeal(BuildContext context, Meal meal){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetails(meal: meal),));
}

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 18,),
          SizedBox(height: 18,),
          Text('Try select a different category!', style: Theme.of(context).textTheme.bodyLarge,)
        ],
      ),
    );
    if(meals.isNotEmpty){
         content =  ListView.builder(
           itemCount: meals.length,
              itemBuilder: (ctx, index) =>
                  MealItem(
                    meal: meals[index],
                    onSelectMeal: (meal) {
                      selectMeal(context, meal);
                      },
                  )
         );
        }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content
    );
  }
}
