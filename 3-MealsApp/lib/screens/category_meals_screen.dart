import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../items/meal.item.dart';
import '../adaptive_widget/AdaptiveappBar.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeNameScreen = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitDate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loadedInitDate) {
      final Category routeArgs =
          ModalRoute.of(context)?.settings.arguments as Category;
      categoryTitle = routeArgs.title;
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(routeArgs.id))
          .toList();
      _loadedInitDate = true;
    }
  }

  void _removeMeal(String meailId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == meailId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(categoryTitle!, AppBar(), []),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              meal: displayedMeals![index], deleteMealHandler: _removeMeal);
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
