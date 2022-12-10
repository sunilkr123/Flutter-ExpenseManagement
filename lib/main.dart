 import 'package:expense_management/chart.dart';
import 'package:expense_management/new_transaction.dart';
import 'package:expense_management/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 import './user_transaction.dart';
 import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Expense Management App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.cyan,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight:FontWeight.bold,
            fontSize:25,),

        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<TransactionData> _transaction =  [];

  List<TransactionData> get _recentTransactions {
    return _transaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txtTitle,double txtAmount, DateTime selectedDate) {
    final newTxt = TransactionData(DateTime.now().toString(), txtTitle, txtAmount, selectedDate);
    setState(() {
      _transaction.add(newTxt);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          onTap: (){},
          child: Newtransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
      );
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Management'),
        actions: [
          IconButton(onPressed: () => _startNewTransaction(context),
        icon: Icon(Icons.add)),
        ],
      ),
     body: _transaction.isEmpty ? Center(
       child: Image.asset('assets/images/nodata.png',fit: BoxFit.cover,),
     ) : Container( child:
         Column(children: [
           Chart(_recentTransactions),
          TransactionList(_transaction,_deleteTransaction),
       ],),
     ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    floatingActionButton:
    FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () => _startNewTransaction(context)
      ,),
     );
  }
}
