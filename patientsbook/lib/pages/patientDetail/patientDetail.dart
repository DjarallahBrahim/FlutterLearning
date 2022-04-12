import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:patientsbook/database/isar_database.dart.dart';
import 'package:patientsbook/models/patients.dart';
import 'package:provider/provider.dart';

import '../../common/app_colors.dart';
import '../../helpers/Sizeconfig.dart';

class patientDetail extends StatefulWidget {
  @override
  State<patientDetail> createState() => _patientDetailState();
}

class _patientDetailState extends State<patientDetail> {
  late Isar isarBDD;

  PastientDatas? patientData;

  void getPatientFromBdd(int id) async {
    GetIt locator = GetIt.instance;
    isarBDD = locator<Isar>();
    final queryResult = await isarBDD.pastientDatass.get(id);
    setState(() {
      patientData = queryResult!;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final patientId = ModalRoute.of(context)?.settings.arguments as int;
    // final loadedProduct =
    //     Provider.of<Patients>(context, listen: false).findById(patientId);
    getPatientFromBdd(patientId);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    DateFormat formatter = DateFormat('yyyy/MM/dd');

    return patientData != null
        ? Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.bgColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(children: [
              Card(
                  color: AppColor.white,
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                      margin: EdgeInsets.all(10),
                      width: SizeConfig.safeBlockHorizontal * 80,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(children: [
                                Text(
                                  'Identificateur',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 1.5,
                                  ),
                                ),
                                Text(
                                  '#${patientData!.id}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 1,
                                  ),
                                ),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 6),
                              ]),
                            ],
                          ),
                          //Personnel form
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PersonalData(
                                        title: 'Nom du patient',
                                        data: patientData!.nom,
                                        heightField:
                                            SizeConfig.safeBlockHorizontal * 4),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                        title: 'Prénom du patient',
                                        data: patientData!.prenom,
                                        heightField:
                                            SizeConfig.safeBlockHorizontal * 4),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                        title: 'Sexe du patient',
                                        data: patientData!.sexe,
                                        heightField:
                                            SizeConfig.safeBlockHorizontal * 4),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                  ],
                                ),
                              ),
                              SizedBox(width: SizeConfig.safeBlockVertical * 3),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    PersonalData(
                                        title: 'Date de naissance',
                                        data: formatter
                                            .format(patientData!.dateNaissance),
                                        heightField:
                                            SizeConfig.safeBlockHorizontal * 4),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                        title: 'Date d\'entrée',
                                        data: formatter
                                            .format(patientData!.dateEntre),
                                        heightField:
                                            SizeConfig.safeBlockHorizontal * 4),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                        title: 'Date de sortie',
                                        data: patientData!.dateSortie != null
                                            ? formatter.format(
                                                patientData!.dateSortie!)
                                            : '',
                                        heightField:
                                            SizeConfig.safeBlockHorizontal * 4),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(children: [
                                Text(
                                  'Suivi médicale',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 1.5,
                                  ),
                                ),
                                Text(
                                  '#${patientData!.id}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 1,
                                  ),
                                ),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 6),
                              ]),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    PersonalData(
                                      title: 'diagnostic',
                                      data: patientData!.diagnostic,
                                      heightField:
                                          SizeConfig.safeBlockHorizontal * 8,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                      title: "Signe Cliniques",
                                      data: patientData!.signeCliniques,
                                      heightField:
                                          SizeConfig.safeBlockHorizontal * 8,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                      title: "Protocole Opératoire",
                                      data: patientData!.protocolParaclinique,
                                      heightField:
                                          SizeConfig.safeBlockHorizontal * 8,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                      title: "Les anticedents",
                                      data: patientData!.anticedents,
                                      heightField:
                                          SizeConfig.safeBlockHorizontal * 8,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                  ],
                                ),
                              ),
                              SizedBox(width: SizeConfig.safeBlockVertical * 3),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    PersonalData(
                                      title: "Examen paraclinique",
                                      data: patientData!.examenParaclinique,
                                      heightField:
                                          SizeConfig.safeBlockHorizontal * 8,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                      title: "Traitement",
                                      data: patientData!.traitement,
                                      heightField:
                                          SizeConfig.safeBlockHorizontal * 8,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                      title: "Suite post operatoire",
                                      data: patientData!.suitePostOperatoire,
                                      heightField:
                                          SizeConfig.safeBlockHorizontal * 8,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    PersonalData(
                                      title: "Score ou classification",
                                      data: patientData!.scoreClassification,
                                      heightField:
                                          SizeConfig.safeBlockHorizontal * 8,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )))
            ]),
          )
        : Container(
            child: Center(child: Text('Error')),
          );
  }
}

class PersonalData extends StatelessWidget {
  final String title;
  final String data;
  final double heightField;
  const PersonalData({
    required this.title,
    required this.data,
    required this.heightField,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            title,
            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 1.3),
          ),
        ),
        Container(
          width: double.infinity,
          height: heightField,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColor.blue, width: 0.8),
          ),
          child: ListView(children: [
            Text(data,
                style:
                    TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 1.3),
                textAlign: TextAlign.left),
          ]),
        ),
      ],
    );
  }
}
