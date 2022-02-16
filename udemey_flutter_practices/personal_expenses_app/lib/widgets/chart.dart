import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widgets/chart_bar.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTrx;

  const Chart({Key? key, required this.recentTrx}) : super(key: key);

  List<Map<String, dynamic>> get transactionChartValues {
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
        return {
          'day': DateFormat.E().format(weekday).substring(0, 1),
          'amount': totalSum,
        };
      },
    );
  }

  double get iWillChangeThisLater {
    return transactionChartValues.fold(
      0.0,
      (previousValue, nextItem) => previousValue + nextItem['amount'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: transactionChartValues
            .map(
              (e) => Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: ChartBar(
                  e['day'],
                  e['amount'],
                  iWillChangeThisLater == 0.0
                      ? 0.0
                      : e['amount'] / iWillChangeThisLater,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
