import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:patientsbook/database/isar_database.dart.dart';
import 'package:patientsbook/pages/dashbord/widgets/actionItem.dart';

class UserActions extends StatelessWidget {
  Future<List<PastientDatas>> getPatientFromBdd(String nom) async {
    GetIt locator = GetIt.instance;
    var isarBDD = locator<Isar>();
    // List<PastientDatas> queryResult = await isarBDD.pastientDatass
    //     .where()
    //     .nameWordsAnyEqualTo(nom)
    //     .or()
    //     .nameWordsAnyStartsWith(nom)
    //     .findAll();
    List<PastientDatas> queryResult =
        await isarBDD.pastientDatass.filter().nomContains(nom).findAll();
    // setState(() {
    //   patientData = queryResult!;
    // });
    return queryResult;
  }

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
            actionType: 'add',
            findPatientsFromBbb: getPatientFromBdd),
        ActionItem(
            title: 'Rechercher',
            imageAssets: "assets/microscope.png",
            actionType: 'search',
            findPatientsFromBbb: getPatientFromBdd),
        ActionItem(
            title: 'Exporter',
            imageAssets: "assets/outilsmedical.png",
            actionType: 'exporte',
            findPatientsFromBbb: getPatientFromBdd),
      ]),
    );
  }
}
