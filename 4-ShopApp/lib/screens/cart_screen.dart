import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/orders.dart';
import '../widgets/cart_item.dart' as cartitemwidget;

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
                    '\$${cart.totalAmoun.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                OrderButton(cart: cart)
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => cartitemwidget.CartItem(
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

class OrderButton extends StatefulWidget {
  final Cart cart;
  OrderButton({required this.cart});

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (widget.cart.totalAmoun <= 0 || _isloading)
          ? null
          : () async {
              setState(() {
                _isloading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmoun,
              );
              setState(() {
                _isloading = false;
              });
              widget.cart.clear();
            },
      child: _isloading ? CircularProgressIndicator() : const Text('Order Now'),
    );
  }
}
