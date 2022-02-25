import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../items/main_drower.dart';
import './favorite_screen.dart';
import './categories_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> _favoriteMeal;

  TabScreen(this._favoriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget._favoriteMeal), 'title': 'Yout Favorites'}
    ];
  }

  void _selectPAge(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrower(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPAge,
          // backgroundColor: Theme.of(context).colorScheme.fr,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Categories',
              icon: const Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Favorites',
              icon: const Icon(Icons.favorite),
            ),
          ]),
    );
  }
}
