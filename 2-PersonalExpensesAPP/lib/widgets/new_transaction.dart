// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  final Function addNewTransactipon;

  NewTransaction(this.addNewTransactipon);

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
            ),
            TextField(
              toolbarOptions: const ToolbarOptions(copy: false),
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountControler,
            ),
            TextButton(
              onPressed: () {
                addNewTransactipon(
                    titleControler.text, double.parse(amountControler.text));
              },
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
