import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/meals_providers.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarianFree,
  veganFree,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarianFree: false,
          Filter.veganFree: false,
        });

  void setFilters(Map<Filter, bool> filtersList) {
    state = filtersList;
  }

  void setFilter(Filter filterKey, bool boolvalue) {
    state = {
      ...state,
      filterKey: boolvalue,
    };
  }
}

final fiterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) {
  return FilterNotifier();
});

final avaiableMeallsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedMeals = ref.watch(fiterProvider);

  return meals.where((element) {
    if (selectedMeals[Filter.glutenFree]! && !element.isGlutenFree) {
      return false;
    }
    if (selectedMeals[Filter.lactoseFree]! && !element.isLactoseFree) {
      return false;
    }
    if (selectedMeals[Filter.vegetarianFree]! && !element.isVegetarian) {
      return false;
    }
    if (selectedMeals[Filter.veganFree]! && !element.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
