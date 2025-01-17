import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_f/category_m.dart';
import 'package:meal_f/category_screen.dart';
import 'package:meal_f/drawer.dart';
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

  void showMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void favoriteMealStatus(Meal meal){
    final isExitingMeal = favoriteMeal.contains(meal);
    if(isExitingMeal){
      setState(() {
        favoriteMeal.remove(meal);
        showMessage('Item removed in favorite');
      });
    }else{
      setState(() {
        favoriteMeal.add(meal);
        showMessage('Item is added in favorite');
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
      drawer: MainDrawer(),
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
