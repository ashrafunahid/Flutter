import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          // primaryColor: Colors.orange,
          accentColor: Colors.orange,
          fontFamily: 'RobotoCondensed',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 20,
            ),
          ),
        ),
        title: 'Personal Expenses App',
        home: MyHomePage(),
      ),
    );


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void _openTransactionForm(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (_){
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
            onTap: (){},
          );
        }
    );
  }

  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: "t1", title: "New Laptop", amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "New Desktop", amount: 71.99, date: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "New Linux", amount: 54.99, date: DateTime.now()),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses App"),
        actions: [
          IconButton(
              onPressed: (){
                _openTransactionForm(context);
              },
              icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Text("Charts"),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _openTransactionForm(context);
        },
      ),
    );
  }
}
