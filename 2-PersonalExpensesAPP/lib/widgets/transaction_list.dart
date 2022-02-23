import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './TransactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> trasactions;
  final Function deleteTransaction;

  TransactionList(this.trasactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return trasactions.isNotEmpty
        ? ListView(
            children: trasactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      trasactions: tx,
                      deleteTransaction: deleteTransaction,
                    ))
                .toList())
        : LayoutBuilder(builder: (context, constraints) {
            return Column(children: [
              Text(
                'No Transacation added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]);
          });
  }
}
