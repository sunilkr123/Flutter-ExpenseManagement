import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class TransactionList extends StatelessWidget {

  final List<TransactionData> userTransaction;
  TransactionList(this.userTransaction);

  @override
  Widget build(BuildContext context) {

    return Container(
     height: 500,
      child: ListView.builder(itemBuilder: (ctx, index) {
        return Card(
          child: Row(children: [
            Container(
              child:
              Text(
                '\$${userTransaction[index].amount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink, width: 2,),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userTransaction[index].title,
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),
                Text(
                  DateFormat('yyyy-MMM-dd, MM:hh a').format(
                      userTransaction[index].date),
                  style: TextStyle(color: Colors.grey,),)
              ],)
          ],),
        );
      }, itemCount: userTransaction.length,
      ),
    );
  }
}