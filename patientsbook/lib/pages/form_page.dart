import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:patientsbook/database/isar_database.dart.dart';
import 'package:patientsbook/pages/formPatient/formPatient.dart';

import '../common/app_colors.dart';

class FormPage extends StatelessWidget {
  static final String routeName = '/formPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
          title: const Text("Ajouter"),
          backgroundColor: AppColor.bgColor,
          foregroundColor: Colors.black),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Main Body Part
              FormPatient(),
            ],
          ),
        ),
      ),
    );
  }
}
