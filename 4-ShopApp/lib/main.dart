import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/auth.dart';
import 'package:shop_app/models/orders.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/splash_screen.dart';
import 'package:shop_app/screens/user_product_scree.dart';

import './models/cart.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './models/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Auth()),
          ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) => Products('', '', []),
            update: (ctx, auth, previousProducts) => Products(
              auth.token,
              auth.userUd,
              previousProducts == null ? [] : previousProducts.items,
            ),
          ),
          ChangeNotifierProvider(create: (ctx) => Cart()),
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (_) => Orders('', '', []),
            update: (ctx, auth, previousOrders) => Orders(
              auth.token,
              auth.userUd,
              previousOrders == null ? [] : previousOrders.orders,
            ),
          ),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, child) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple,
                accentColor: Colors.amber,
              ).copyWith(
                secondary: Colors.deepOrange,
                primary: Colors.purple,
              ),
              primarySwatch: Colors.purple,
              canvasColor: Colors.white,
              fontFamily: 'Lato',
              primaryTextTheme: const TextTheme(
                headline1: TextStyle(color: Colors.white),
              ),
            ),
            home: auth.isAuth
                ? ProductsOverviewScreen()
                : FutureBuilder(
                    future: auth.tryAutologin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen()),
            routes: {
              ProductsOverviewScreen.routeName: (context) =>
                  ProductsOverviewScreen(),
              ProdcutDetailScreen.routeName: (context) => ProdcutDetailScreen(),
              CartScreen.routName: (context) => CartScreen(),
              UserProductScreen.routeName: (context) => UserProductScreen(),
              EditProductScreen.routeName: (context) => EditProductScreen(),
              OrdersScreen.routeName: ((context) => OrdersScreen()),
            },
          ),
        ));
  }
}
