
import 'package:flutter/material.dart';

import '../Widget/category_gridItem.dart';
import '../Model/category_m.dart';
import '../Data/dummy_data.dart';
import '../meal.dart';
import 'meal_screen.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({
    super.key,
    required this.availableMeal
  });


  final List<Meal> availableMeal;

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  void selectedCategory(BuildContext context, Category categorys){

   final filterMeals = widget.availableMeal.where(
           (meal) => meal.categories.contains(categorys.id)).toList();
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

    return AnimatedBuilder(
        animation: _animationController,
        child:  GridView(
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
        ),
        builder: (context, child) => SlideTransition(
          position: Tween(
            begin: Offset(0, 0.3),
            end: Offset(0, 0),
          ).animate( CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut
          )

          ),
          child: child,)
          //   Padding(
          // padding: EdgeInsets.only(top: 100 -  _animationController.value * 100),
          // child: child,)
    );


  }
}
