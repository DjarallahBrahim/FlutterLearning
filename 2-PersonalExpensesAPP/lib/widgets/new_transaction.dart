// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransactipon;

  NewTransaction(this.addNewTransactipon);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();

  final amountControler = TextEditingController();

  void submitData() {
    final entredTitle = titleControler.text;
    final entredMount = double.parse(amountControler.text);

    if (entredMount >= 0 && entredTitle.isNotEmpty) {
      widget.addNewTransactipon(
        titleControler.text,
        double.parse(amountControler.text),
      );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleControler,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              toolbarOptions: const ToolbarOptions(copy: false),
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountControler,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text('Add Transaction'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
