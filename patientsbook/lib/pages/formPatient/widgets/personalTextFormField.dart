import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

class personalTextFormField extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController textEditingController;

  personalTextFormField(
      {required this.fieldTitle, required this.textEditingController});

  //Widget settings
  final _outlineInputBorderValid = OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.blue, width: 1.0),
  );
  final _outlineInputBorderError = const OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 179, 28, 9), width: 1.0),
  );

  @override
  Widget build(BuildContext context) {
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
}
