import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../items/main_drower.dart';

class FilterScreen extends StatefulWidget {
  static String routeNameScreen = '/filter';
  final Function savefilterHandler;
  final Map<String, bool> _filters;

  FilterScreen(this._filters, this.savefilterHandler);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _gloutienFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _gloutienFree = widget._filters['gluten']!;
    _vegetarian = widget._filters['vegetarian']!;
    _vegan = widget._filters['vegan']!;
    _lactoseFree = widget._filters['lactose']!;
  }

  Widget _itemFilterBuilder(title, subTitle, switchValue, updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        activeColor: Theme.of(context).colorScheme.secondary,
        value: switchValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Filters'), actions: [
          IconButton(
              onPressed: () {
                final _filters = {
                  'gluten': _gloutienFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.savefilterHandler(_filters);
                Navigator.of(context)
                    .pushReplacementNamed(CategoriesScreen.routeNameScreen);
              },
              icon: const Icon(Icons.save))
        ]),
        drawer: const MainDrower(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection !',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _itemFilterBuilder(
                  'Gluten-Free',
                  'Only include gluten-free meals.',
                  _gloutienFree,
                  (newValue) => {
                    setState(() {
                      _gloutienFree = newValue;
                    })
                  },
                ),
                _itemFilterBuilder(
                  'Lactose-Free',
                  'Only include Lactose-free meals.',
                  _lactoseFree,
                  (newValue) => {
                    setState(() {
                      _lactoseFree = newValue;
                    })
                  },
                ),
                _itemFilterBuilder(
                  'Vegetarian',
                  'Only include Vegetarian meals.',
                  _vegetarian,
                  (newValue) => {
                    setState(() {
                      _vegetarian = newValue;
                    })
                  },
                ),
                _itemFilterBuilder(
                  'Vegan',
                  'Only include Vegan meals.',
                  _vegan,
                  (newValue) => {
                    setState(() {
                      _vegan = newValue;
                    })
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
