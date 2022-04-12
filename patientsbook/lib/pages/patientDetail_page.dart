import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:patientsbook/database/isar_database.dart.dart';
import 'package:patientsbook/pages/patientDetail/patientDetail.dart';

import '../common/app_colors.dart';
import '../helpers/Sizeconfig.dart';
import '../pdfGenerator/pdfService.dart';
import 'form_page.dart';

class PatientDetailPage extends StatefulWidget {
  static final String routeName = '/patientDetailPage';

  @override
  State<PatientDetailPage> createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailPage> {
  PastientDatas? pastientDatas;
  var patientId;
  Future<void> _showMyDialog(BuildContext contextPage, int id) async {
    return showDialog<void>(
      context: contextPage,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.bgColor,
          title: const Text('Attention!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oui'),
              onPressed: () {
                deletePAtient(contextPage, id);
              },
            ),
            TextButton(
              child: const Text('Non'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deletePAtient(BuildContext context, int id) async {
    GetIt locator = GetIt.instance;
    Isar isarBDD = locator<Isar>();

    await isarBDD.writeTxn((pastientDatass) async {
      await isarBDD.pastientDatass.delete(id); // or delete operations
      Navigator.pop(context, true);
      Navigator.pop(context, true);
    });
  }

  void fiendPatientById(int id) async {
    GetIt locator = GetIt.instance;
    Isar isarBDD = locator<Isar>();

    await isarBDD.writeTxn((pastientDatass) async {
      final queryResult =
          await isarBDD.pastientDatass.get(id); // or delete operations
      setState(() {
        pastientDatas = queryResult;
      });
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var patId = ModalRoute.of(context)?.settings.arguments as int;
    fiendPatientById(patId);
    setState(() {
      patientId = patId;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // patientId = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: const Text("Consulter"),
        backgroundColor: AppColor.bgColor,
        foregroundColor: Colors.black,
        actions: [
          InkWell(
            onTap: () => createPDF(pastientDatas),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.blue2,
                  borderRadius: BorderRadius.circular(80)),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              margin: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "Exporter",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 0.9,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
              ),
            ),
          ),
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
          ),
          InkWell(
            onTap: () => _showMyDialog(context, patientId),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.red, borderRadius: BorderRadius.circular(80)),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              margin: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "Supprimer",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 0.9,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
              ),
            ),
          ),
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
