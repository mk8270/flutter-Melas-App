import 'package:flutter/material.dart';
import 'package:mealsapp/models/meals.dart';
import 'package:mealsapp/widgets/meals_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meals, required this.onSelectMeal});

  final Meal meals;

  String get comflexsityText {
    return meals.complexity.name[0].toUpperCase() +
        meals.complexity.name.substring(1);
  }

  String get affortblityText {
    return meals.affordability.name[0].toUpperCase() +
        meals.affordability.name.substring(1);
  }

  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meals);
        },
        child: Stack(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meals.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
              child: Column(
                children: [
                  Text(
                    meals.title,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealsItemTrait(
                        icon: Icons.schedule,
                        label: '${meals.duration} min  ',
                      ),
                      MealsItemTrait(
                        icon: Icons.work,
                        label: comflexsityText,
                      ),
                      MealsItemTrait(
                        icon: Icons.attach_money,
                        label: affortblityText,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
