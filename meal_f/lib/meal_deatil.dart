import 'package:flutter/material.dart';

import 'meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal, required this.onFavorite});

  final Meal meal;
  final void Function(Meal meal) onFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title,),
          actions: [
            IconButton(
                onPressed: (){onFavorite(meal);},
                icon: Icon(Icons.star_border))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(meal.imageUrl, height: 200, width: double.infinity,),
              SizedBox(height: 20,),
          
              Text('Ingredient',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:  Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              for(final ingredient in meal.ingredients)
                Text(ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:  Theme.of(context).colorScheme.onBackground),
                ),
              SizedBox(height: 20,),
          
              Text('Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:  Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
          
              for(final steps in meal.steps)
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Text(steps,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:  Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                )
          
            ],
          ),
        )

    );
  }
}
