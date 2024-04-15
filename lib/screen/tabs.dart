import 'package:flutter/material.dart';
import 'package:mealsapp/models/meals.dart';
import 'package:mealsapp/screen/categories.dart';
import '../data/dummy_data.dart';
import 'fillter_screen.dart';
import 'mealscreen.dart';

import '../widgets/main_drawer...dart';

const kFilterMeals = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarianFree: false,
  Filter.veganFree: false,
};

class TapsSceen extends StatefulWidget {
  const TapsSceen({super.key});

  @override
  State<TapsSceen> createState() => _TapsSceenState();
}

class _TapsSceenState extends State<TapsSceen> {
  int _selectPageIndex = 0;
  final List<Meal> _favoriteMeal = [];
  Map<Filter, bool> selectedMeals = kFilterMeals;

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

  void drawerTextFunction(String text) async {
    Navigator.of(context).pop();
    if (text == 'Filters') {
      final reselt = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(
            curentFilter: selectedMeals,
          ),
        ),
      );

      setState(() {
        selectedMeals = reselt ?? kFilterMeals;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaibleMeal = dummyMeals.where((element) {
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

    Widget activePage = GategorieScreen(
      avaibleMeals: avaibleMeal,
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
      drawer: Drawar(
        drawerText: drawerTextFunction,
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
