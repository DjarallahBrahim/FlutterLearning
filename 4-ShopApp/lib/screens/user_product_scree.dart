import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/edit_product.dart';
import 'package:shop_app/widgets/app_draw.dart';
import 'package:shop_app/widgets/user_product.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product';

  Future<void> _refrecheProdcuts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refrecheProdcuts(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (ctx, index) => Column(
              children: [
                UserProductItem(
                    id: productsData.items[index].id,
                    title: productsData.items[index].title,
                    imgUrl: productsData.items[index].imageUrl),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
