import 'package:flutter/material.dart';
import 'package:mealsapp/screen/categories.dart';
import 'fillter_screen.dart';
import 'mealscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/main_drawer...dart';
import '../providers/favorite_proviiders.dart';
import '../providers/filter_provider.dart';

const kFilterMeals = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarianFree: false,
  Filter.veganFree: false,
};

class TapsSceen extends ConsumerStatefulWidget {
  const TapsSceen({super.key});

  @override
  ConsumerState<TapsSceen> createState() => _TapsSceenState();
}

class _TapsSceenState extends ConsumerState<TapsSceen> {
  int _selectPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  void drawerTextFunction(String text) async {
    Navigator.of(context).pop();
    if (text == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaibleMeal = ref.watch(avaiableMeallsProvider);

    Widget activePage = GategorieScreen(
      avaibleMeals: avaibleMeal,
    );
    var activePageTitle = 'Gategorie';

    if (_selectPageIndex == 1) {
      final favoriteMeal = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meal: favoriteMeal,
      );
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
