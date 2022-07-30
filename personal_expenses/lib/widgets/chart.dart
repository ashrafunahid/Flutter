import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValue{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for(var i = 0; i < recentTransactions.length; i++){
        if(recentTransactions[i] .date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year){
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay).substring(0, 1), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending{
    return groupedTransactionValue.fold(0.0, (sum, item) {
      return sum + item['amount'];
    })  ;
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValue);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Flexible(
        fit: FlexFit.tight,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValue.map((e) {
              return ChartBar(e['day'], e['amount'],  totalSpending == 0.0 ? 0.0 :(e['amount'] as double) / totalSpending);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
