import 'package:flutter/material.dart';
import 'package:mealsapp/models/meals.dart';
import 'package:mealsapp/screen/categories.dart';
import 'package:mealsapp/screen/mealscreen.dart';

class TapsSceen extends StatefulWidget {
  const TapsSceen({super.key});

  @override
  State<TapsSceen> createState() => _TapsSceenState();
}

class _TapsSceenState extends State<TapsSceen> {
  int _selectPageIndex = 0;
  final List<Meal> _favoriteMeal = [];

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExiting = _favoriteMeal.contains(meal);

    void snacbarMessanger(String mess) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mess),
        ),
      );
    }

    if (isExiting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      snacbarMessanger('Removed');
    } else {
      setState(() {
        _favoriteMeal.add(meal);
      });
      snacbarMessanger('add as favorite');
    }
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = GategorieScreen(
      doggleMealStasus: _toggleMealFavoriteStatus,
    );
    var activePageTitle = 'Gategorie';

    if (_selectPageIndex == 1) {
      activePage = MealsScreen(
          doggleMealStatus: _toggleMealFavoriteStatus, meal: _favoriteMeal);
      activePageTitle = 'Foverite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
        onTap: (value) {
          _selectPage(value);
        },
        currentIndex: _selectPageIndex,
      ),
    );
  }
}
