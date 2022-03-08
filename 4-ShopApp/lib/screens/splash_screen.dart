import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeNname = '/splash-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading....'),
      ),
    );
  }
}
