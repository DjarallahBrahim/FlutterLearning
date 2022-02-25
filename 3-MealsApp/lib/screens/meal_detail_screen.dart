import 'package:flutter/material.dart';
import 'package:meals_app/adaptive_widget/AdaptiveappBar.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeNameScreen = '/meal-detail';

  final Function _toggleFavorite;
  final Function _isMealFavorite;

  MealDetailScreen(this._toggleFavorite, this._isMealFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AdaptiveAppBar(
          meal.title,
          AppBar(),
          [],
          () => _toggleFavorite(meal.id),
          _isMealFavorite(meal.id) ? Icons.star : Icons.star_border),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(
                            meal.ingredients[index],
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      )),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(child: Text('# ${index + 1}')),
                  title: Text(meal.steps[index]),
                ),
                const Divider(),
              ]),
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(meal.id),
      ),
    );
  }
}
