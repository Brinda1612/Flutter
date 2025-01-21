import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_f/Screen/category_screen.dart';
import 'package:meal_f/Model/drawer.dart';
import 'package:meal_f/Provider/favorite_provider.dart';
import 'package:meal_f/Screen/meal_screen.dart';

import '../Provider/filter_provider.dart';
import 'filter_screen.dart';

const kInitialFilter = {
  Filter.glutenFree : false,
  Filter.lactoseFree : false,
  Filter.vegan : false,
  Filter.vegetarian : false,
};
class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key,
    // required this.onFavorite
  });
  // final void Function(Meal meal) onFavorite;
  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {

  int selectIndex = 0;
  void selectPage(int index){
    setState(() {
      selectIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == 'Filters'){
     final result =await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (ctx) => FiltersScreen()),
      );
    }
    }
  @override
  Widget build(BuildContext context) {

    final availableMeal = ref.watch(filterMealProvider);

    Widget activePage = Categoryscreen(
        availableMeal: availableMeal
    );

    var activePageTitle = 'Category';

    if(selectIndex == 1){
      final favoriteMeals = ref.watch(favoriteMealProvider);
      activePage = Mealscreen(
          meals: favoriteMeals
        // activePageTitle = "Your Favorites";
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),

      drawer: MainDrawer(onSeletcScreen: setScreen),

      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: selectPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
            // BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Filter')
          ]
      ),
    );
  }
}
