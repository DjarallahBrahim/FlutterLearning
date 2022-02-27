import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider() ,
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
          ).copyWith(
            secondary: Colors.deepOrange,
            primary: Colors.purple,
          ),
          primarySwatch: Colors.pink,
          canvasColor: Colors.white,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProdcutDetailScreen.routeName: (context) => ProdcutDetailScreen()
        },
      ),
    );
  }
}
