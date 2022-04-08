import 'package:flutter/material.dart';
import 'package:patientsbook/pages/dashbord/widgets/actionItem.dart';

class UserActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        // ActionItem('Ajouter', "assets/medicalrecord.png", 'add'),
        // ActionItem('Rechercher', "assets/microscope.png", 'search'),
        // ActionItem('Exporter', "assets/outilsmedical.png", 'exporte')
        ActionItem(
            title: 'Ajouter',
            imageAssets: "assets/medicalrecord.png",
            actionType: 'add'),
        ActionItem(
            title: 'Rechercher',
            imageAssets: "assets/microscope.png",
            actionType: 'search'),
        ActionItem(
            title: 'Exporter',
            imageAssets: "assets/outilsmedical.png",
            actionType: 'exporte'),
      ]),
    );
  }
}
