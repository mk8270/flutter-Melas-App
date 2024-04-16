import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meals.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);
  bool toggleFavoriteMealsStatus(Meal meals) {
    final mealsIsFavorite = state.contains(meals);

    if (mealsIsFavorite) {
      state = state.where((element) => element.id != meals.id).toList();
      return false;
    } else {
      state = [...state, meals];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
