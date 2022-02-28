import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool _showOnlyFavorite;

  ProductGrid(this._showOnlyFavorite);

  @override
  Widget build(BuildContext context) {
    //lisner
    final productsData = Provider.of<Products>(context);
    final products =
        _showOnlyFavorite ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //columns
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
