import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title,),
      ),
      body: Column(
        children: [
          Image.network(meal.imageUrl, height: 200, width: double.infinity,),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Ingredient : ',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color:  Theme.of(context).colorScheme.onBackground),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for(final ingredient in meal.ingredients)
                      Text(ingredient, style: TextStyle(color: Colors.black), textAlign: TextAlign.justify,)
                  ],
                )

              ],
            ),
          )
          // Text('Ingredient',
          // style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //     color:  Theme.of(context).colorScheme.onBackground),
          // ),
          // for(final ingredient in meal.ingredients)
          //   Text(ingredient, style: TextStyle(color: Colors.white),)

        ],
      )

    );
  }
}
