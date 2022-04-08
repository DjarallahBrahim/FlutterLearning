import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patientsbook/models/patients.dart';
import 'package:provider/provider.dart';

import '../../common/app_colors.dart';
import '../../helpers/Sizeconfig.dart';

class patientDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy/MM/dd');
    final patientId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Patients>(context, listen: false).findById(patientId);
    SizeConfig().init(context);
    return Container(
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
                              fontSize: SizeConfig.safeBlockHorizontal * 1.5,
                            ),
                          ),
                          Text(
                            '#${loadedProduct.id}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 1,
                            ),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 6),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PersonalData(
                                  title: 'Nom du patient',
                                  data: loadedProduct.nom,
                                  heightField:
                                      SizeConfig.safeBlockHorizontal * 3),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                  title: 'Prénom du patient',
                                  data: loadedProduct.prenom,
                                  heightField:
                                      SizeConfig.safeBlockHorizontal * 3),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                  title: 'Sexe du patient',
                                  data: loadedProduct.sex,
                                  heightField:
                                      SizeConfig.safeBlockHorizontal * 3),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                            ],
                          ),
                        ),
                        SizedBox(width: SizeConfig.safeBlockVertical * 3),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PersonalData(
                                  title: 'Date de naissance',
                                  data: formatter
                                      .format(loadedProduct.dateNaissance),
                                  heightField:
                                      SizeConfig.safeBlockHorizontal * 3),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                  title: 'Date d\'entrée',
                                  data:
                                      formatter.format(loadedProduct.dateEntre),
                                  heightField:
                                      SizeConfig.safeBlockHorizontal * 3),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                  title: 'Date de sortie',
                                  data: loadedProduct.dateSortie != null
                                      ? formatter
                                          .format(loadedProduct.dateSortie!)
                                      : '',
                                  heightField:
                                      SizeConfig.safeBlockHorizontal * 3),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
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
                              fontSize: SizeConfig.safeBlockHorizontal * 1.5,
                            ),
                          ),
                          Text(
                            '#${loadedProduct.id}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 1,
                            ),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 6),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PersonalData(
                                title: 'diagnostic',
                                data: loadedProduct.diagnostic,
                                heightField: SizeConfig.safeBlockHorizontal * 8,
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                title: "Signe Cliniques",
                                data: loadedProduct.signeCliniques,
                                heightField: SizeConfig.safeBlockHorizontal * 8,
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                title: "Protocole Opératoire",
                                data: loadedProduct.protocolParaclinique,
                                heightField: SizeConfig.safeBlockHorizontal * 8,
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                title: "Les anticedents",
                                data: loadedProduct.anticedents,
                                heightField: SizeConfig.safeBlockHorizontal * 8,
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                            ],
                          ),
                        ),
                        SizedBox(width: SizeConfig.safeBlockVertical * 3),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PersonalData(
                                title: "Examen paraclinique",
                                data: loadedProduct.examenParaclinique,
                                heightField: SizeConfig.safeBlockHorizontal * 8,
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                title: "Traitement",
                                data: loadedProduct.traitement,
                                heightField: SizeConfig.safeBlockHorizontal * 8,
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                title: "Suite post operatoire",
                                data: loadedProduct.suitePostOperatoire,
                                heightField: SizeConfig.safeBlockHorizontal * 8,
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              PersonalData(
                                title: "Score ou classification",
                                data: loadedProduct.scoreClassification,
                                heightField: SizeConfig.safeBlockHorizontal * 8,
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )))
      ]),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            title,
            style: TextStyle(fontSize: 10),
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
                style: TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.left),
          ]),
        ),
      ],
    );
  }
}
