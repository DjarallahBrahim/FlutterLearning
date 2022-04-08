import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'dashbord/dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget button = InkWell(
    onTap: () => {},
    child: Container(
      decoration: BoxDecoration(
          color: AppColor.yellow, borderRadius: BorderRadius.circular(100)),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Text(
        "Modifier",
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SideBar(),
      // key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppColor.blue,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Main Body Part
            Expanded(
              child: Dashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
