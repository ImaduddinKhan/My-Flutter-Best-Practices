import 'dart:collection';

import 'package:flutter/scheduler.dart';

class Transactions {
  final String id;
  final String title;
  final DateTime date;
  final double amount;

  Transactions(
      {required this.id,
      required this.amount,
      required this.title,
      required this.date});
}
