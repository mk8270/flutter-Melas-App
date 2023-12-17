import 'package:flutter/material.dart';

class MealsItemTrait extends StatelessWidget {
  const MealsItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 17),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
