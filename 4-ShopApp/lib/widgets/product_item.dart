import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProdcutDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => null,
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            // style: TextStyle(fontFamily: 'Lato'),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => null,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
