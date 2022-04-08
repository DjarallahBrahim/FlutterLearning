// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patientsbook/models/patient.dart';
import 'package:patientsbook/models/patients.dart';
import 'package:provider/provider.dart';

import '../../common/app_colors.dart';
import '../../helpers/Sizeconfig.dart';

class FormPatient extends StatefulWidget {
  @override
  State<FormPatient> createState() => _FormPatientState();
}

class _FormPatientState extends State<FormPatient> {
  //form global key
  final _formGlobalKey = GlobalKey<FormState>();

  //form controleur
  var _nomController = TextEditingController();
  var _prenoController = TextEditingController();
  var _enterDateController = TextEditingController();
  var _exiteDateController = TextEditingController();
  var _naissanceDateController = TextEditingController();
  var _diagnosticController = TextEditingController();
  var _signeCliniqueController = TextEditingController();
  var _protocolDateController = TextEditingController();
  var _anticedentsController = TextEditingController();
  var _examanParacliniqueController = TextEditingController();
  var _traitementController = TextEditingController();
  var _suitePostOperatoireController = TextEditingController();
  var _scoreClassificationController = TextEditingController();

  //variables
  bool _isinit = true; //is page init
  var patientId;
  var sexPAtient;
  DateFormat formatter = DateFormat('yyyy/MM/dd');
  late patient _initPatient;

  var _initValue = {
    'id': '',
    'nom': '',
    'prenom': '',
    'sex': '',
    'dateNaissance': '',
    'dateEntre': '',
    'dateSortie': '',
    'diagnostic': '',
    'signeCliniques': '',
    'protocolParaclinique': '',
    'suitePostOperatoire': '',
    'anticedents': '',
    'scoreClassification': '',
    'traitement': '',
  };
  var _newPatient = {
    'id': '',
    'nom': '',
    'prenom': '',
    'sex': '',
    'dateNaissance': '',
    'dateEntre': '',
    'dateSortie': '',
    'diagnostic': '',
    'signeCliniques': '',
    'protocolParaclinique': '',
    'suitePostOperatoire': '',
    'anticedents': '',
    'scoreClassification': '',
    'traitement': '',
  };
  //Widget settings
  final _outlineInputBorderValid = OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.blue, width: 1.0),
  );
  final _outlineInputBorderError = OutlineInputBorder(
    borderSide:
        const BorderSide(color: Color.fromARGB(255, 179, 28, 9), width: 1.0),
  );

  //Function system
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    var selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        locale: Locale("fr", ''),
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        controller.value = TextEditingValue(text: formatter.format(picked));
      });
    }
  }

  Future<void> _saveForm() async {
    var _nvpatient = patient(
      patientId ??
          Provider.of<Patients>(context, listen: false)
              .newIdentificateur
              .toString(),
      _nomController.text,
      _prenoController.text,
      sexPAtient,
      formatter.parse(_naissanceDateController.text),
      formatter.parse(_enterDateController.text),
      _exiteDateController.text.isNotEmpty
          ? formatter.parse(_exiteDateController.text)
          : null,
      _diagnosticController.text,
      _signeCliniqueController.text,
      _protocolDateController.text,
      _suitePostOperatoireController.text,
      _anticedentsController.text,
      _scoreClassificationController.text,
      _traitementController.text,
      _examanParacliniqueController.text,
    );
    await Provider.of<Patients>(context, listen: false).addPatient(_nvpatient);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isinit) {
      var arguments = ModalRoute.of(context)!.settings.arguments;
      var pageType;
      if (arguments != null) {
        setState(() {
          patientId = arguments;
        });
      }
      if (patientId != null) {
        _initPatient = Provider.of<Patients>(context, listen: false)
            .findById(patientId as String);
        _initValue = {
          'id': _initPatient.id,
          'nom': _initPatient.nom,
          'prenom': _initPatient.prenom,
          'sex': _initPatient.sex,
          'dateNaissance': _initPatient.dateNaissance.toString(),
          'dateEntre': _initPatient.dateEntre.toString(),
          'dateSortie': _initPatient.dateSortie != null
              ? _initPatient.dateSortie.toString()
              : '',
          'diagnostic': _initPatient.diagnostic,
          'signeCliniques': _initPatient.signeCliniques,
          'protocolParaclinique': _initPatient.protocolParaclinique,
          'suitePostOperatoire': _initPatient.suitePostOperatoire,
          'anticedents': _initPatient.anticedents,
          'scoreClassification': _initPatient.scoreClassification,
          'traitement': _initPatient.traitement,
        };
        _nomController.text = _initPatient.nom;
        _prenoController.text = _initPatient.prenom;
        _naissanceDateController.text =
            formatter.format(_initPatient.dateNaissance).toString();
        _enterDateController.text =
            formatter.format(_initPatient.dateEntre).toString();
        _exiteDateController.text = _initPatient.dateSortie != null
            ? formatter.format(_initPatient.dateSortie!).toString()
            : '';
        _diagnosticController.text = _initPatient.diagnostic;
        _signeCliniqueController.text = _initPatient.signeCliniques;
        _protocolDateController.text = _initPatient.protocolParaclinique;
        _suitePostOperatoireController.text = _initPatient.suitePostOperatoire;
        _anticedentsController.text = _initPatient.anticedents;
        _scoreClassificationController.text = _initPatient.scoreClassification;
        _traitementController.text = _initPatient.traitement;
        _examanParacliniqueController.text = _initPatient.examenParaclinique;
        setState(() {
          sexPAtient = _initPatient.sex;
        });
      }
    }
    setState(() {
      _isinit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var patientDataProvider = Provider.of<Patients>(context, listen: false);

    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Form(
            key: _formGlobalKey,
            child: Card(
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
                              '#${(_initValue['id'] != null && _initValue['id']!.isNotEmpty) ? _initValue['id'] : patientDataProvider.newIdentificateur}',
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
                                personalTextFormField(
                                    context, "Nom", _nomController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                personalTextFormField(
                                    context, "Prénom", _prenoController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                genderDropDownFormField(context),
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
                                dateFormField(context, _naissanceDateController,
                                    'Date de naissance', true),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                dateFormField(context, _enterDateController,
                                    "Date d'entrée", true),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                dateFormField(context, _exiteDateController,
                                    'Date de sortie', false),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //Diagnostique form
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
                              '#${(_initValue['id'] != null && _initValue['id']!.isNotEmpty) ? _initValue['id'] : patientDataProvider.newIdentificateur}',
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
                                diagnostiqueTextFormField(context, "Diagnostic",
                                    _diagnosticController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                diagnostiqueTextFormField(
                                    context,
                                    "Signe Cliniques",
                                    _signeCliniqueController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                diagnostiqueTextFormField(
                                    context,
                                    "Protocole Opératoire",
                                    _protocolDateController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                diagnostiqueTextFormField(context,
                                    "Les anticedents", _anticedentsController),
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
                                diagnostiqueTextFormField(
                                    context,
                                    "Examen paraclinique",
                                    _examanParacliniqueController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                diagnostiqueTextFormField(context, "Traitement",
                                    _traitementController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                diagnostiqueTextFormField(
                                    context,
                                    "Suite post operatoire",
                                    _suitePostOperatoireController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                                diagnostiqueTextFormField(
                                    context,
                                    "Score ou classification",
                                    _scoreClassificationController),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 3),
                              ],
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formGlobalKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            _saveForm();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Patient ajouté !',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  backgroundColor: AppColor.blue),
                            );
                          }
                        },
                        child: const Text('Enregistrer'),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField<String> genderDropDownFormField(
      BuildContext context) {
    return DropdownButtonFormField<String>(
      value: sexPAtient,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
          labelText: "Sex",
          labelStyle: Theme.of(context).textTheme.bodyText1,
          enabledBorder: _outlineInputBorderValid,
          focusedBorder: _outlineInputBorderValid,
          errorBorder: _outlineInputBorderError,
          focusedErrorBorder: _outlineInputBorderError,
          hintText: '0.0',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      icon: const Icon(Icons.arrow_downward),
      dropdownColor: AppColor.white,
      onChanged: (String? newValue) {
        setState(() {
          _newPatient['sex'] = newValue!;
          sexPAtient = newValue;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      items: <String>[
        'Homme',
        'Femme',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  TextFormField personalTextFormField(BuildContext context, String fieldTitle,
      TextEditingController textEditingController) {
    return TextFormField(
      // The validator receives the text that the user has entered.
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        labelText: fieldTitle,
        labelStyle: Theme.of(context).textTheme.bodyText1,
        enabledBorder: _outlineInputBorderValid,
        focusedBorder: _outlineInputBorderValid,
        errorBorder: _outlineInputBorderError,
        focusedErrorBorder: _outlineInputBorderError,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      controller: textEditingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  TextFormField dateFormField(
      BuildContext context,
      TextEditingController textEditingController,
      String fieldTitle,
      bool obligatoire) {
    return TextFormField(
      // The validator receives the text that the user has entered.
      style: Theme.of(context).textTheme.bodyText1,
      readOnly: true,
      decoration: InputDecoration(
          labelText: fieldTitle,
          labelStyle: Theme.of(context).textTheme.bodyText1,
          enabledBorder: _outlineInputBorderValid,
          focusedBorder: _outlineInputBorderValid,
          errorBorder: _outlineInputBorderError,
          focusedErrorBorder: _outlineInputBorderError,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: Icon(
            Icons.calendar_month,
            color: AppColor.blue,
          )),
      onTap: () => _selectDate(context, textEditingController),
      controller: textEditingController,
      validator: (value) {
        if (obligatoire && (value == null || value.isEmpty)) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  TextFormField diagnostiqueTextFormField(BuildContext context,
      String fieldTitle, TextEditingController textEditingController) {
    return TextFormField(
      // The validator receives the text that the user has entered.
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
          labelText: fieldTitle,
          labelStyle: Theme.of(context).textTheme.bodyText1,
          enabledBorder: _outlineInputBorderValid,
          focusedBorder: _outlineInputBorderValid,
          errorBorder: _outlineInputBorderError,
          focusedErrorBorder: _outlineInputBorderError,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          alignLabelWithHint: true),
      keyboardType: TextInputType.multiline,
      controller: textEditingController,
      maxLines: 4,
    );
  }
}
