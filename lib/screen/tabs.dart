import 'package:flutter/material.dart';
import 'package:mealsapp/screen/categories.dart';
import 'package:mealsapp/screen/mealscreen.dart';

class TapsSceen extends StatefulWidget {
  const TapsSceen({super.key});

  @override
  State<TapsSceen> createState() => _TapsSceenState();
}

class _TapsSceenState extends State<TapsSceen> {
  int _selectPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const GategorieScreen();
    var activePageTitle = 'Gategorie';

    if (_selectPageIndex == 1) {
      activePage = const MealsScreen(meal: []);
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
