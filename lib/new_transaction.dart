
import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {
  final Function addTrans;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Newtransaction(this.addTrans);

  void onSubmitData() {
   final titleValue = titleController.text;
   final amountValue = double.parse(amountController.text);
   if (titleValue.isEmpty || amountValue < 0) {
     return;
   }
   addTrans(titleValue, amountValue);
  }

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
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (amountValue) => inputAmount = amountValue,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> onSubmitData,
            ),
            ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: () {
                  onSubmitData();
                 // this.addTrans(titleController.text, double.parse(amountController.text));
                }
            ),
          ],),
      ),);
  }
}