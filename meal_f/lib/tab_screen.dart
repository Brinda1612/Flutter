import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_f/category_m.dart';
import 'package:meal_f/category_screen.dart';
import 'package:meal_f/meal.dart';
import 'package:meal_f/meal_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key,
    // required this.onFavorite
  });

  // final void Function(Meal meal) onFavorite;


  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  final List<Meal> favoriteMeal = [];

  void favoriteMealStatus(Meal meal){
    final isExitingMeal = favoriteMeal.contains(meal);
    if(isExitingMeal){
      setState(() {
        favoriteMeal.remove(meal);
      });
    }else{
      setState(() {
        favoriteMeal.add(meal);
      });
    }
  }
  int selectIndex = 0;
  void selectPage(int index){
    setState(() {
      selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    Widget activePage = Categoryscreen(onFavorite: favoriteMealStatus);
    var activePageTitle = 'Category';
    if(selectIndex == 1){
      activePage = Mealscreen(
          meals: favoriteMeal,
          onFavorite: favoriteMealStatus);
      activePageTitle = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: selectPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ]
      ),
    );
  }
}
