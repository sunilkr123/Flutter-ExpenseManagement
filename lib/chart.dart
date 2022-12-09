import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
import './chart_bar.dart';
class Chart extends StatelessWidget {
  final List<TransactionData> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekday).substring(0,1), 'amount': totalSum};
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum+(item['amount'] as double);
    });
  }
  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...groupedTransactionValues.map((data) {
            return ChartBar(data['day'] as String, data['amount'] as double, (data['amount'] as double)/totalSpending);
         }).toList()
        ],
      ),
    );
  }
}
