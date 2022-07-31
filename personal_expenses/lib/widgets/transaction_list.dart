import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransaction;

  TransactionList(this.transaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight * .60,
        child: Image.asset(
          'assets/images/hourglass.gif',
          fit: BoxFit.cover,
        ),
      );
    })
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (context, index) {
              // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$ ${transaction[index].amount.toStringAsFixed(2)}',
              //           style:
              //           TextStyle(color: Colors.deepPurple, fontSize: 20),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             transaction[index].title,
              //             style: TextStyle(
              //                 fontSize: 18, fontWeight: FontWeight.bold),
              //           ),
              //           Text(
              //             DateFormat.yMd().add_jm().format(transaction[index].date),
              //             style: TextStyle(color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
              return Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        child: Text(
                          '\$ ${transaction[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    DateFormat.yMd().add_jm().format(transaction[index].date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width >460 ?
                      ElevatedButton.icon(
                          onPressed: (){
                            deleteTransaction(transaction[index].id);
                          },
                          icon: Icon(Icons.delete),
                        label: Text("Delete", style: TextStyle(color: Colors.red),),
                      )
                      :IconButton(
                      onPressed: (){
                        deleteTransaction(transaction[index].id);
                      },
                      icon: Icon(Icons.delete)
                  ),
                ),
              );
            },
          );
  }
}
