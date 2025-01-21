import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_f/Provider/favorite_provider.dart';
import 'package:meal_f/Provider/filter_provider.dart';

import '../meal.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favoriteMeal = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeal.contains(meal);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            meal.title,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // onFavorite(meal);
                 final wasAdded= ref.read(favoriteMealProvider.notifier).favoriteMealStatus(meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(wasAdded ? 'Meal add in Favorite' : 'Meal Remove in Favorite')
                      ));
                },
                icon: Icon(
                    isFavorite ? Icons.star :
                    Icons.star_border)
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 200,
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ingredient',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              for (final steps in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Text(
                    steps,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                )
            ],
          ),
        ));
  }
}
