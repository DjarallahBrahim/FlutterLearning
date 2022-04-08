import 'package:flutter/material.dart';
import 'package:patientsbook/pages/patientDetail/patientDetail.dart';

import '../common/app_colors.dart';
import '../helpers/Sizeconfig.dart';
import 'form_page.dart';

class PatientDetailPage extends StatelessWidget {
  static final String routeName = '/patientDetailPage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final patientId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: const Text("Ajouter"),
        backgroundColor: AppColor.bgColor,
        foregroundColor: Colors.black,
        actions: [
          InkWell(
            onTap: () => {
              Navigator.of(context)
                  .popAndPushNamed(FormPage.routeName, arguments: patientId)
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.yellow,
                  borderRadius: BorderRadius.circular(80)),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              margin: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "Modifier",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 0.9,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return patientDetail();
              }),
        ),
      ),
    );
  }
}
