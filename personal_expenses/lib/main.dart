import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/transaction.dart';

void main() => runApp(
      MaterialApp(
        title: 'Personal Expenses App',
        home: MyHomePage(),
      ),
    );

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Laptop", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Desktop", amount: 71.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Linux", amount: 54.99, date: DateTime.now()),
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
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$ ${e.amount}',
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 20),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          e.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMd().add_jm().format(e.date),
                          style: TextStyle(color: Colors.grey),
                        ),
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
