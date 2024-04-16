import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/filter_provider.dart';

// import '../widgets/main_drawer...dart';
// import 'tabs.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _isGlutenFreemels = false;
  var _isLactoseFreemels = false;
  var _isVeganFreemels = false;
  var _isVegetarianFreemels = false;

  @override
  void initState() {
    final curentFilter = ref.read(fiterProvider);
    _isGlutenFreemels = curentFilter[Filter.glutenFree]!;
    _isLactoseFreemels = curentFilter[Filter.lactoseFree]!;
    _isVeganFreemels = curentFilter[Filter.veganFree]!;
    _isVegetarianFreemels = curentFilter[Filter.vegetarianFree]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youer Filters'),
      ),
      body: PopScope(
        onPopInvoked: (didPop) {
          ref.read(fiterProvider.notifier).setFilters({
            Filter.glutenFree: _isGlutenFreemels,
            Filter.lactoseFree: _isLactoseFreemels,
            Filter.vegetarianFree: _isVegetarianFreemels,
            Filter.veganFree: _isVeganFreemels,
          });
          // Navigator.of(context).pop();
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
