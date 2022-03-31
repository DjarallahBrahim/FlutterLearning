// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _enterDateController = TextEditingController();
  final _exiteDateController = TextEditingController();
  final _naissanceDateController = TextEditingController();

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
    DateFormat formatter = DateFormat('yyyy/MM/dd');
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Form(
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
                          '#11505',
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
                            personalTextFormField(context, "Nom du patient"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            personalTextFormField(context, "Nom du patient"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            genderDropDownFormField(context),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
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
                            dateFormField(
                                context, _enterDateController, "Date d'entrée"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            dateFormField(context, _exiteDateController,
                                'Date de sortie'),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            dateFormField(context, _naissanceDateController,
                                'Date de naissance'),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
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
                          '#11505',
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
                            diagnostiqueTextFormField(context, "Diagnostic"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            diagnostiqueTextFormField(
                                context, "Signe Cliniques"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            diagnostiqueTextFormField(
                                context, "Protocole Opératoire"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
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
                            diagnostiqueTextFormField(context, "Diagnostic"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            diagnostiqueTextFormField(
                                context, "Signe Cliniques"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            diagnostiqueTextFormField(
                                context, "Protocole Opératoire"),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  DropdownButtonFormField<String> genderDropDownFormField(
      BuildContext context) {
    return DropdownButtonFormField<String>(
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
          // dropdownValue = newValue!;
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

  TextFormField personalTextFormField(BuildContext context, String fieldTitle) {
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

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  TextFormField dateFormField(BuildContext context,
      TextEditingController textEditingController, String fieldTitle) {
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
          suffixIcon: Icon(
            Icons.calendar_month,
            color: AppColor.blue,
          )),
      onTap: () => _selectDate(context, textEditingController),
      controller: textEditingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  TextFormField diagnostiqueTextFormField(
      BuildContext context, String fieldTitle) {
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
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
