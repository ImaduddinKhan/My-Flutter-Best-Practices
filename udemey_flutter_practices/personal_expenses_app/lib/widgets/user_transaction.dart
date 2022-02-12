import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/new_transactioin.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addNewTx: _addNewTransactions,
        ),
        TransactionList(
          tx: _transactions,
        ),
      ],
    );
  }
}
