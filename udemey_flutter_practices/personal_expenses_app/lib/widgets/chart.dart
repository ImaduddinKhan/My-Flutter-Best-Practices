import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTrx;

  const Chart({Key? key, required this.recentTrx}) : super(key: key);

  List<Map<String, Object>> get transactionChartValues {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var i = 0; i < recentTrx.length; i++) {
          if (recentTrx[i].date.day == weekday.day &&
              recentTrx[i].date.month == weekday.month &&
              recentTrx[i].date.year == weekday.year) {
            totalSum = recentTrx[i].amount;
          }
        }

        print(
          DateFormat.E().format(weekday),
        );
        print(totalSum);

        return {
          'day': DateFormat.E().format(weekday),
          'amount': totalSum,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(transactionChartValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: transactionChartValues
            .map((e) => Text('${e['day']}: ${e['amount']}'))
            .toList(),
      ),
    );
  }
}
