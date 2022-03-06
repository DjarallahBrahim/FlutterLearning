import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_draw.dart';
import 'package:shop_app/widgets/badge.dart';

import '../widgets/product_grid.dart';

enum FilterOptions { Favorite, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorite = false;
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    setState(() {
      _isInit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == FilterOptions.Favorite) {
                  _showOnlyFavorite = true;
                } else if (value == FilterOptions.All) {
                  _showOnlyFavorite = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => const [
              PopupMenuItem(
                child: Text('Only Favorite'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Shaw All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, childConsumer) => Badge(
                child: childConsumer!,
                value: cart.itemCount.toString(),
                color: Colors.red),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(CartScreen.routName)},
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(_showOnlyFavorite),
    );
  }
}
