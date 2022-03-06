import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/orders.dart' show Orders;
import 'package:shop_app/widgets/app_draw.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ordersData =
        Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders')),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ordersData.orders.length,
              itemBuilder: (ctx, idex) => OrderItem(ordersData.orders[idex]),
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 13, 192, 103),
                        fontSize: 20)),
                Text(ordersData.totalAmount.toStringAsFixed(2),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 13, 192, 103),
                        fontSize: 20))
              ],
            ),
          )
        ],
      ),
    );
  }
}
