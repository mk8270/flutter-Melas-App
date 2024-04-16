import 'package:flutter_riverpod/flutter_riverpod.dart';

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
