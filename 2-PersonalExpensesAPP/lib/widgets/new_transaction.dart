// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransactipon;

  NewTransaction(this.addNewTransactipon);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime? _selectedDate;
  void _submitData() {
    final entredTitle = _titleControler.text;
    final entredMount = double.parse(_amountControler.text);

    if (entredMount >= 0 && entredTitle.isNotEmpty && _selectedDate != null) {
      widget.addNewTransactipon(_titleControler.text,
          double.parse(_amountControler.text), _selectedDate);
    } else {
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    void _dateHandler(newDate) {
      if (newDate == null) {
        return;
      }
      setState(() {
        _selectedDate = newDate;
      });
    }

    void showCupertinoDatePicker(dateHandler) {
      showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => Container(
                height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
                padding: const EdgeInsets.only(top: 6.0),
                // The Bottom margin is provided to align the popup above the system navigation bar.
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                // Provide a background color for the popup.
                color: CupertinoColors.systemBackground.resolveFrom(context),
                // Use a SafeArea widget to avoid system overlaps.
                child: SafeArea(
                  top: false,
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime newDate) =>
                        dateHandler(newDate),
                  ),
                ),
              ));
    }

    void _presentDatePicker(dateHandler) {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2019),
              lastDate: DateTime.now())
          .then((date) => dateHandler(date));
    }

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleControler,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountControler,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.1,
              child: Row(children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!).toString()}',
                  ),
                ),
                AdaptiveFlatButton('Chose Date', showCupertinoDatePicker,
                    _presentDatePicker, _dateHandler)
              ]),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onPrimary: Theme.of(context).textTheme.button!.color,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
