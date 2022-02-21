// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return null;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              toolbarOptions: const ToolbarOptions(copy: false),
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountControler,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!).toString()}',
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Chose Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
