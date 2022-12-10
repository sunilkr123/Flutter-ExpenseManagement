import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class TransactionList extends StatelessWidget {

  final List<TransactionData> userTransaction;
  Function deleteTransaction;

  TransactionList(this.userTransaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                child: Text('\$${userTransaction[index].amount.toStringAsFixed(2)}'),
              ),
            ),
          ),
            title:Text(userTransaction[index].title, style: Theme.of(context).textTheme.titleMedium,) ,
            subtitle:   Text(
              DateFormat('yyyy-MMM-dd, MM:hh a').format(
                  userTransaction[index].date),
              style: Theme.of(context).textTheme.titleSmall,),
            trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).primaryColor,
              onPressed:() =>
                  deleteTransaction(userTransaction[index].id),
            ),
          )
        );
      }, itemCount: userTransaction.length,
      ),
    );
  }
}

