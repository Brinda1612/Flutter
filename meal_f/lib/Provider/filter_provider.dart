import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_f/Provider/meal_provider.dart';

enum Filter{
  glutenFree,lactoseFree, vegetarian, vegan,
}

class FilterProvider extends StateNotifier<Map<Filter, bool>>{
  FilterProvider():super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false
  });



  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive){
    state = {
      ...state,
      filter : isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
        (ref) => FilterProvider()
);

final filterMealProvider = Provider((ref){

  final meal = ref.watch(mealProvider);
  final activeFilter = ref.watch(filterProvider);

 return  meal .where((meal) {
    if(activeFilter[Filter.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree){
      return false;
    } if(activeFilter[Filter.vegetarian]! && !meal.isVegetarian){
      return false;
    } if(activeFilter[Filter.vegan]! && !meal.isVegan){
      return false;
    }
    return true;
  }).toList();

});