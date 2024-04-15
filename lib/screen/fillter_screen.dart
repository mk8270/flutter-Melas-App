import 'package:flutter/material.dart';

// import '../widgets/main_drawer...dart';
// import 'tabs.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarianFree,
  veganFree,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.curentFilter});

  final Map<Filter, bool> curentFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFreemels = false;
  var _isLactoseFreemels = false;
  var _isVeganFreemels = false;
  var _isVegetarianFreemels = false;

  @override
  void initState() {
    _isGlutenFreemels = widget.curentFilter[Filter.glutenFree]!;
    _isLactoseFreemels = widget.curentFilter[Filter.lactoseFree]!;
    _isVeganFreemels = widget.curentFilter[Filter.veganFree]!;
    _isVegetarianFreemels = widget.curentFilter[Filter.vegetarianFree]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youer Filters'),
      ),
      // drawer: Drawar(
      //   drawerText: (text) {
      //     Navigator.pop(context);
      //     if (text == 'Meals') {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (ctx) => const TapsSceen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFreemels,
            Filter.lactoseFree: _isLactoseFreemels,
            Filter.vegetarianFree: _isVegetarianFreemels,
            Filter.veganFree: _isVeganFreemels,
          });
        },
        child: Column(
          children: [
            SwitchlistTile(
              isvalue: _isGlutenFreemels,
              titleText: "Gloten",
              isLLocal: (localvar) {
                setState(() {
                  _isGlutenFreemels = localvar;
                });
              },
            ),
            SwitchlistTile(
              isvalue: _isLactoseFreemels,
              titleText: "Lactose",
              isLLocal: (localvar) {
                setState(() {
                  _isLactoseFreemels = localvar;
                });
              },
            ),
            SwitchlistTile(
              isvalue: _isVeganFreemels,
              titleText: "Vegan",
              isLLocal: (localvar) {
                setState(() {
                  _isVeganFreemels = localvar;
                });
              },
            ),
            SwitchlistTile(
              isvalue: _isVegetarianFreemels,
              titleText: "Vegetarian",
              isLLocal: (localvar) {
                setState(() {
                  _isVegetarianFreemels = localvar;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

//widget
class SwitchlistTile extends StatelessWidget {
  const SwitchlistTile(
      {super.key,
      required this.titleText,
      required this.isLLocal,
      required this.isvalue});

  final String titleText;
  final void Function(bool localvar) isLLocal;
  final bool isvalue;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isvalue,
      onChanged: isLLocal,
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        'Only include $titleText Free Meals',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 24),
    );
  }
}
