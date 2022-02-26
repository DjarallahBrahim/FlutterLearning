import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meals_app/adaptive_widget/AdaptiveappBar.dart';

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
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget._favoriteMeal), 'title': 'Yout Favorites'}
    ];
  }

  void _selectPAge(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget adaptiveTabBAr() {
    return AdaptiveAppBar(
        Text(_pages[_selectedPageIndex]['title']), AppBar(), []);
  }

  BottomNavigationBarItem bottomNavigationBarItemBuilder(
      Color backGroundColor, String label, Widget icon) {
    return BottomNavigationBarItem(
      backgroundColor: backGroundColor,
      label: label,
      icon: icon,
    );
  }

  Widget cupertinoTabScaffoldBuilder() {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            bottomNavigationBarItemBuilder(Theme.of(context).primaryColor,
                'Categories', const Icon(CupertinoIcons.create)),
            bottomNavigationBarItemBuilder(Theme.of(context).primaryColor,
                'Favorites', const Icon(CupertinoIcons.heart)),
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return _pages[index]['page'];
        });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            appBar: adaptiveTabBAr() as PreferredSizeWidget,
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
                  bottomNavigationBarItemBuilder(Theme.of(context).primaryColor,
                      'Categories', const Icon(Icons.category)),
                  bottomNavigationBarItemBuilder(Theme.of(context).primaryColor,
                      'Favorites', const Icon(Icons.favorite)),
                ]),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.white,
              middle: Text(_pages[_selectedPageIndex]['title']),
            ),
            child: cupertinoTabScaffoldBuilder());
  }
}
