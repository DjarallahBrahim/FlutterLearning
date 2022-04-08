import 'package:patientsbook/models/patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Patients with ChangeNotifier {
  List<patient> _patientItem = [
    patient(
      "1",
      "Sarra",
      "Sassi",
      "Femme",
      DateTime.parse("1995-05-12"),
      DateTime.now(),
      DateTime.now().add(Duration(days: 2)),
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
    ),
    patient(
        "2",
        "Abdou",
        "Sam",
        "Homme",
        DateTime.parse("1995-05-12"),
        DateTime.now(),
        null,
         "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
      "Ce ci est un diagnostic de type ****",
       )];

  List<patient> get patientItem {
    return [..._patientItem];
  }

  Future<void> addPatient(patient p) async {
    final patientIndex =
        _patientItem.indexWhere((element) => element.id == p.id);
    if (patientIndex >= 0) {
      _patientItem[patientIndex] = p;
      notifyListeners();
    } else {
      _patientItem.add(p);
      notifyListeners();
    }
  }

  int get newIdentificateur {
    return _patientItem.length + 1;
  }

  patient findById(String id) {
    return _patientItem.firstWhere((patientElement) => patientElement.id == id);
  }
}
