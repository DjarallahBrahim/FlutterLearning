import 'package:flutter/material.dart';
import '../adaptive_widget/AdaptiveappBar.dart';

import '../items/category_item.dart';
import '../dummyData/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeNameScreen = '/';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //width max
        maxCrossAxisExtent: (mediaQuery.size.width -
                mediaQuery.padding.left -
                mediaQuery.padding.right) /
            2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories
          .map((catDate) => CategoryItem(
              id: catDate.id, title: catDate.title, color: catDate.color))
          .toList(),
    );
  }
}
