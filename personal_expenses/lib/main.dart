import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';

void main() => runApp(
      MaterialApp(
        title: 'Personal Expenses App',
        home: MyHomePage(),
      ),
    );

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(id: "t1", title: "New Laptop", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t2", title: "New Desktop", amount: 71.99, date: DateTime.now()),
    Transaction(id: "t2", title: "New Linux", amount: 54.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses App"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.green,
              child: Text("Charts"),
            ),
          ),
          Column(
            children: transactions.map((e) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(child: Text(e.amount.toString())),
                    Column(
                      children: <Widget>[
                        Text(e.title),
                        Text(e.date.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
