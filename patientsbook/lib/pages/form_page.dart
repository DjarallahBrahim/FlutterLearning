import 'package:flutter/material.dart';
import 'package:patientsbook/pages/formPatient/formPatient.dart';

import '../common/app_colors.dart';

class FormPage extends StatelessWidget {
  static final String routeName = '/formPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(title: Text("Ajouter")),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Main Body Part
            SingleChildScrollView(child: FormPatient()),
          ],
        ),
      ),
    );
  }
}
