import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/filter_provider.dart';

// import '../widgets/main_drawer...dart';
// import 'tabs.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterMap = ref.watch(fiterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youer Filters'),
      ),
      body: Column(
        children: [
          SwitchlistTile(
            isvalue: filterMap[Filter.glutenFree]!,
            titleText: "Gloten",
            isLLocal: (localvar) {
              ref
                  .read(fiterProvider.notifier)
                  .setFilter(Filter.glutenFree, localvar);
            },
          ),
          SwitchlistTile(
            isvalue: filterMap[Filter.lactoseFree]!,
            titleText: "Lactose",
            isLLocal: (localvar) {
              ref
                  .read(fiterProvider.notifier)
                  .setFilter(Filter.lactoseFree, localvar);
            },
          ),
          SwitchlistTile(
            isvalue: filterMap[Filter.veganFree]!,
            titleText: "Vegan",
            isLLocal: (localvar) {
              ref
                  .read(fiterProvider.notifier)
                  .setFilter(Filter.veganFree, localvar);
            },
          ),
          SwitchlistTile(
            isvalue: filterMap[Filter.vegetarianFree]!,
            titleText: "Vegetarian",
            isLLocal: (localvar) {
              ref
                  .read(fiterProvider.notifier)
                  .setFilter(Filter.vegetarianFree, localvar);
            },
          ),
        ],
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
