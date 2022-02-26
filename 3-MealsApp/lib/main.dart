import 'dart:ui';

import 'package:flutter/material.dart';
import './dummyData/dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';

import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where(
        (meal) {
          if (_filters['gluten']! && !meal.isGlutenFree) return false;
          if (_filters['lactose']! && !meal.isLactoseFree) return false;
          if (_filters['vegan']! && !meal.isVegan) return false;
          if (_filters['vegetarian']! && !meal.isVegetarian) return false;
          return true;
        },
      ).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    print(mealId);
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
          ).copyWith(
            secondary: Colors.amber,
            primary: const Color.fromARGB(237, 177, 15, 69),
          ),
          primarySwatch: Colors.pink,
          canvasColor: Colors.white,
          fontFamily: 'Raleway',
          //   textTheme: ThemeData.light()
          //       .textTheme
          //       .copyWith(
          //         bodyText1: const TextStyle(
          //           color: Color.fromARGB(20, 51, 51, 1),
          //         ),
          // bodyText2: const TextStyle(
          //   color: Color.fromARGB(20, 51, 51, 1),
          // ),
          //         headline6: const TextStyle(
          // fontSize: 20,
          // fontFamily: 'RobotoCondensed',
          // fontWeight: FontWeight.bold,
          //         ),
          //       )
          //       ,
          // ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            //default text style
            bodyText2: TextStyle(fontSize: 15.0),
          )),
      // home: const CategoriesScreen(),
      routes: {
        // CategoriesScreen.routeNameScreen: (context) => const CategoriesScreen(),
        '/': (context) => TabScreen(_favoriteMeal),
        CategoryMealsScreen.routeNameScreen: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeNameScreen: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeNameScreen: ((context) =>
            FilterScreen(_filters, _setFilters)),
      },
      // onGenerateRoute: (settings) {
      //   print(settings);
      //   return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
