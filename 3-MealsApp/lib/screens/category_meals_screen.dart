import 'package:flutter/material.dart';
import '../adaptive_widget/AdaptiveappBar.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final Category routeArgs =
        ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: AdaptiveAppBar('DeliMeal', AppBar(), []),
      body: Center(
        child: Text('The recipes For The Category!',
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
