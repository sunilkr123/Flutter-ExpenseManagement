
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
      TransactionData("1", "Books", 12.2444, DateTime.now()),
      TransactionData("1", "New Shoes", 12.2444, DateTime.now()),
    ];

    void _addTransaction(String txtTitle,double txtAmount) {
      final newTxt = TransactionData(DateTime.now().toString(), txtTitle, txtAmount, DateTime.now());
      setState(() {
        _transaction.add(newTxt);
      });
    }

  @override
  Widget build(BuildContext context) {
 return Column(
   children: [
   SizedBox(
       //height: 200,
       child: Newtransaction(_addTransaction)),
   // TransactionList(_transaction),
 ],);
  }
}