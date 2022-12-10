
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Newtransaction extends StatefulWidget {
  final Function addTrans;
  Newtransaction(this.addTrans);
  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? _selectedDate;

  void onSubmitData() {
   final titleValue = titleController.text;
   final amountValue = double.parse(amountController.text);
   if (titleValue.isEmpty || amountValue < 0 || _selectedDate == null) {
     return;
   }
   widget.addTrans(titleValue, amountValue, _selectedDate);
   Navigator.of(context).pop();
  }

   void _showDatePicker()  {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime.now(),
      ).then( (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });

      });
  }



  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 300,
      child: Card(
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
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (amountValue) => inputAmount = amountValue,
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_)=> onSubmitData,
                style: TextStyle(fontFamily: 'OpenSans',fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null ? 'No Date Choose!' : 
                      'Picked date: ${DateFormat('yyyy-MMM-dd, MM:hh a').format(_selectedDate!)}'),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: Text('Choose Date', style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
             SizedBox(height: 10,),
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
        ),),
    );
  }
}