import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patientsbook/database/isar_database.dart.dart';
import 'package:patientsbook/pages/patientDetail_page.dart';
import 'package:patientsbook/pdfGenerator/pdfService.dart';

class patientFiltered extends StatelessWidget {
  final PastientDatas patientData;
  final String actionType;
  final DateFormat formatter = DateFormat('yyyy/MM/dd');

  patientFiltered({required this.patientData, required this.actionType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (actionType == 'search') {
          Navigator.of(context).pushNamed(PatientDetailPage.routeName,
              arguments: patientData.id);
        } else if (actionType == 'exporte') {
          createPDF(patientData);
        }
      },
      child: Card(
        color: Colors.white,
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.asset(
              patientData.sexe.toLowerCase() == "homme"
                  ? "assets/homme.png"
                  : "assets/femme.png",
              width: 30,
            ),
          ),
          title: Text('${patientData.nom} ${patientData.prenom}'),
          subtitle: Text(formatter.format(patientData.dateEntre)),
          trailing: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: patientData.dateSortie != null &&
                      (patientData.dateSortie!.isAfter(patientData.dateEntre) ||
                          patientData.dateSortie!
                              .isAtSameMomentAs(patientData.dateEntre))
                  ? Colors.green
                  : Colors.red,
            ),
            height: 10,
            width: 10,
          ),
        ),
      ),
    );
  }
}
