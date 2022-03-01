import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String prodcutId;
  final double price;
  final int quatity;
  final String title;

  CartItem(this.id, this.prodcutId, this.price, this.quatity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(prodcutId);
      },
      direction: DismissDirection.endToStart,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('\$$price')),
            )),
            title: Text(title),
            subtitle: Text('Total: \$${price * quatity}'),
            trailing: Text('$quatity x'),
          ),
        ),
      ),
    );
  }
}
