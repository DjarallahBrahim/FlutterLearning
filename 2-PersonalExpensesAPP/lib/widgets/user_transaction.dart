// ignore_for_file: prefer_const_constructors, unused_field, unused_element

import 'package:flutter/cupertino.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTrasactions extends StatefulWidget {
  const UserTrasactions({Key? key}) : super(key: key);

  @override
  _UserTrasactionsState createState() => _UserTrasactionsState();
}

class _UserTrasactionsState extends State<UserTrasactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'new Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'z1',
      title: 'new Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'e1',
      title: 'new Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'new shirt',
      amount: 12.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'new bag',
      amount: 30.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'new phone',
      amount: 120.99,
      date: DateTime.now(),
    )
  ];

  void _addNewTransactipon(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransactipon),
        TransactionList(_userTransactions),
      ],
    );
  }
}
