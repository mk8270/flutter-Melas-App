import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';

class CategoryGridIdem extends StatelessWidget {
  const CategoryGridIdem(
      {super.key, required this.category, required this.onSelectedCategory});

  final Category category;
  final void Function() onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectedCategory();
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.59),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
