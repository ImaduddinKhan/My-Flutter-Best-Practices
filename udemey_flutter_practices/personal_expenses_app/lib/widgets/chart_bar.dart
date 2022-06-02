import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amountSpending;
  final double percentageOfTotal;

  const ChartBar(this.label, this.amountSpending, this.percentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text(
            '${amountSpending.toStringAsFixed(0)}\Rs',
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentageOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
