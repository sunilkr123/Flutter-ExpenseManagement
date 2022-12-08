
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import './transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return _UserTransaction();
  }
}

class _UserTransaction extends State<UserTransaction> {

    final List<TransactionData> _transaction = [
      TransactionData("1", "abc", 12.2, DateTime.now()),
      TransactionData("1", "abc", 12.2, DateTime.now()),
      TransactionData("1", "abc", 12.2, DateTime.now()),
      TransactionData("1", "abc", 12.2, DateTime.now())
    ];

    void _addTransaction(String txtTitle,double txtAmount) {
      final newTxt = TransactionData(DateTime.now().toString(), txtTitle, txtAmount, DateTime.now());
      setState(() {
        _transaction.add(newTxt);
      });
    }

  @override
  Widget build(BuildContext context) {
 return Column(children: [
   // Container(
   //   width: double.infinity,
   //   child: Card(
   //     color: Colors.blue,
   //     child: Text('My New Chart'),
   //   ),
   // ),
   Newtransaction(_addTransaction),
   TransactionList(_transaction),
 ],);
  }
}