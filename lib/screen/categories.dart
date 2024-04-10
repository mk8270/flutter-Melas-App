import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/screen/mealscreen.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

class GategorieScreen extends StatelessWidget {
  const GategorieScreen({super.key});

  void selecterCategory(BuildContext context, Category category) {
    final filterMeals = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meal: filterMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridIdem(
            onSelectedCategory: () {
              selecterCategory(context, category);
            },
            category: category,
          )
      ],
    );
  }
}
