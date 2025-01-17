import 'package:flutter/material.dart';
import 'package:food/cardOnTap.dart';

import '../Model/food_m.dart';

class FoodItem extends StatelessWidget {
  const FoodItem(this.food, {super.key});

  final Food food;

  void openCardTap(){

  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).colorScheme;
    MediaQuery.of(context).platformBrightness == Brightness.dark;
    return InkWell(
      onTap: (){
        String name1 = 'Brinda';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cardOnTap(food: food)),
      );
      },
        child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Text(
                food.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('\INR ${food.amount.toStringAsFixed(2)}'
                    //     12.1111 => 12.11, \$ THIS is use for printing a simbol behind a amount
                  ),
                  Spacer(),
                  Row(
                    children: [
                     Center(
                       child: categoryIcon[food.category],
                     ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(food.formattedDate)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
            ),
      );
  }
}
