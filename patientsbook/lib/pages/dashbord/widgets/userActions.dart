import 'package:flutter/material.dart';
import 'package:patientsbook/pages/dashbord/widgets/ActionItem.dart';

class UserActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ActionItem('Ajouter', "assets/medicalrecord.png"),
        ActionItem('Rechercher', "assets/microscope.png"),
        ActionItem('Exporter', "assets/outilsmedical.png")
      ]),
    );
  }
}
