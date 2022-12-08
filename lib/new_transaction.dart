import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {
  final Function addTrans;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Newtransaction(this.addTrans);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child:
      Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (titleValue) => inputTitle = titleValue,
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (amountValue) => inputAmount = amountValue,
              controller: amountController,
            ),
            ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: () {
                  this.addTrans(titleController.text, double.parse(amountController.text));
                }
            ),
          ],),
      ),);
  }
}