import 'package:flutter/material.dart';
import 'package:meals_app/dummyData/dummy_data.dart';
import 'package:meals_app/items/meal.item.dart';
import '../adaptive_widget/AdaptiveappBar.dart';
import '../models/category.dart';
import '../models/Meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeNameScreen = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final Category routeArgs =
        ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(routeArgs.id))
        .toList();
    return Scaffold(
      appBar: AdaptiveAppBar(routeArgs.title, AppBar(), []),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(meal: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
