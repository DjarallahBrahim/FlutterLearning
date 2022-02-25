import 'package:flutter/material.dart';
import '../items/meal.item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeal;
  FavoriteScreen(this._favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty) {
      return const Center(
        child: Text('You have no favorite yet! - start adding some !'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              meal: _favoriteMeal[index], deleteMealHandler: () => {});
        },
        itemCount: _favoriteMeal.length,
      );
    }
  }
}
