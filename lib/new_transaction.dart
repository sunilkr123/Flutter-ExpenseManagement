
import 'package:flutter/material.dart';

class Newtransaction extends StatefulWidget {
  final Function addTrans;
  Newtransaction(this.addTrans);
  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void onSubmitData() {
   final titleValue = titleController.text;
   final amountValue = double.parse(amountController.text);
   if (titleValue.isEmpty || amountValue < 0) {
     return;
   }
   widget.addTrans(titleValue, amountValue);
   Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child:
      Container(
         padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (titleValue) => inputTitle = titleValue,
              controller: titleController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: 'OpenSans',fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (amountValue) => inputAmount = amountValue,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> onSubmitData,
              style: TextStyle(fontFamily: 'OpenSans',fontSize: 16, fontWeight: FontWeight.bold),
            ),
           SizedBox(height: 30,)
        ,
            // TextButton(onPressed:  () {
            //   onSubmitData();
            //   // this.addTrans(titleController.text, double.parse(amountController.text));
            // }, child: Text('Add Transaction'))
            SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton(
                  child: Text('Add Transaction'),
                  onPressed: () {
                    onSubmitData();
                   // this.addTrans(titleController.text, double.parse(amountController.text));
                  }
              ),
            ),
          ],),
      ),);
  }
}