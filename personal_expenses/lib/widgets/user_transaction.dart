import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1", title: "New Laptop", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Desktop", amount: 71.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Linux", amount: 54.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount){
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now()
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
