import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class TransactionList extends StatelessWidget {

  final List<TransactionData> userTransaction;
  TransactionList(this.userTransaction);

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
          )
        );
      }, itemCount: userTransaction.length,
      ),
    );
  }
}

/*
* Row(children: [
            Container(
              child:
              Text(
                '\$${userTransaction[index].amount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1,),
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
* */