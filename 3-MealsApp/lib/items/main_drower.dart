import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/filters_screen.dart';

class MainDrower extends StatelessWidget {
  const MainDrower({Key? key}) : super(key: key);

  Widget _builderListTile(
      IconData iconDate, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(iconDate, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text('Cooking Up! ',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          const SizedBox(
            height: 20,
          ),
          _builderListTile(
            Icons.restaurant,
            'Meals',
            () => {
              Navigator.of(context)
                  .pushReplacementNamed(CategoriesScreen.routeNameScreen)
            },
          ),
          _builderListTile(
              Icons.settings,
              'Filters',
              () => {
                    Navigator.of(context)
                        .pushReplacementNamed(FilterScreen.routeNameScreen)
                  }),
        ],
      ),
    );
  }
}
