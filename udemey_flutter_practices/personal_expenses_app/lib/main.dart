// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/chart.dart';
import './models/transaction.dart';
import './widgets/new_transactioin.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.blueGrey,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        // appBarTheme: AppBarTheme(
        //   textTheme: ThemeData.light().textTheme.copyWith(
        //         headline6: const TextStyle(
        //           fontFamily: 'OpenSan',
        //           fontSize: 20,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        // ),
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
  final List<Transactions> _transactions = [
    // Transactions(
    //   id: 't1',
    //   title: 'Spotify',
    //   date: DateTime.now(),
    //   amount: 399,
    // ),
    // Transactions(
    //   id: 't1',
    //   title: 'Pluralsight',
    //   date: DateTime.now(),
    //   amount: 299,
    // ),
  ];

  List<Transactions> get _recentTransactions {
    return _transactions.where(
      (element) {
        return element.date.isAfter(
          DateTime.now().subtract(Duration(days: 7)),
        );
      },
    ).toList();
  }

  _addNewTransactions(String txTitle, double txAmount) {
    final newTx = Transactions(
      id: DateTime.now().toString(),
      amount: txAmount,
      title: txTitle,
      date: DateTime.now(),
    );

    setState(
      () {
        _transactions.add(newTx);
      },
    );
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransactionSheet(context),
          ),
        ],
        title: const Text(
          'Personal Expenses',
          // style: Theme.of(context).appBarTheme.textTheme!.headline6,
          // style: TextStyle(fontFamily: 'OpenSans'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Chart(recentTrx: _recentTransactions),
            ),
            TransactionList(
              tx: _transactions,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startAddNewTransactionSheet(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
