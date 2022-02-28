import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import '../widgets/cart_item.dart' as CartItemWidget;

class CartScreen extends StatelessWidget {
  static const routName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your cart')),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmoun}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(onPressed: () {}, child: const Text('Order Now'))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => CartItemWidget.CartItem(
              cart.items.values.toList()[index].id,
              cart.items.keys.toList()[index],
              cart.items.values.toList()[index].price,
              cart.items.values.toList()[index].quantity,
              cart.items.values.toList()[index].title),
          itemCount: cart.itemCount,
        ))
      ]),
    );
  }
}
