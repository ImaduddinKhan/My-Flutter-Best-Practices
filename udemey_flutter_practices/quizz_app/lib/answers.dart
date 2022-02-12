// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback storedDataFromMain;
  final String e;
  Answer(this.storedDataFromMain, this.e);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(e),
        onPressed: storedDataFromMain,
      ),
    );
  }
}
