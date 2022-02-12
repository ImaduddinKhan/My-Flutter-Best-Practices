// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transactions> transactions = [];
  // String? titleInput;
  // String? amountInput;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
                  color: Colors.blue,
                  child: Text(
                    'Chart Text',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                  elevation: 5,
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
