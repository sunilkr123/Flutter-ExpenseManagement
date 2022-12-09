 import 'package:expense_management/new_transaction.dart';
import 'package:expense_management/transaction_list.dart';
import 'package:flutter/material.dart';
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
        primarySwatch: Colors.green,
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

  // [
  //   TransactionData("1", "Books", 12.2444, DateTime.now()),
  //   TransactionData("1", "New Shoes", 12.2444, DateTime.now()),
  // ];

  void _addTransaction(String txtTitle,double txtAmount) {
    final newTxt = TransactionData(DateTime.now().toString(), txtTitle, txtAmount, DateTime.now());
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
     body: Container( child:
         _transaction.isEmpty ? Center(
            child: Image.asset('assets/images/nodata.png',fit: BoxFit.cover,),
         ) : Column(children: [
         TransactionList(_transaction),
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
