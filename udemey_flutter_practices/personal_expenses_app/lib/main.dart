// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transactioin.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _transactions = [
    Transactions(
      id: 't1',
      title: 'Spotify',
      date: DateTime.now(),
      amount: 399,
    ),
    Transactions(
      id: 't1',
      title: 'Pluralsight',
      date: DateTime.now(),
      amount: 299,
    ),
  ];

  _addNewTransactions(String txTitle, double txAmount) {
    final newTx = Transactions(
      id: DateTime.now().toString(),
      amount: txAmount,
      title: txTitle,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  void _startAddNewTransactionSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(
              addNewTx: _addNewTransactions,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransactionSheet(context),
          ),
        ],
        title: const Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,
              child: const Card(
                child: Center(
                  child: Text(
                    'Chart Text',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(
              tx: _transactions,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startAddNewTransactionSheet(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
