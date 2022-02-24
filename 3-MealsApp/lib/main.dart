import 'dart:ui';

import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(237, 177, 15, 69),
          secondary: Colors.amber, // Your accent color
        ),
        canvasColor: const Color.fromARGB(255, 239, 240, 241),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      routes: {
        CategoriesScreen.routeNameScreen: (context) => const CategoriesScreen(),
        CategoryMealsScreen.routeNameScreen: (context) => CategoryMealsScreen()
      },
    );
  }
}
