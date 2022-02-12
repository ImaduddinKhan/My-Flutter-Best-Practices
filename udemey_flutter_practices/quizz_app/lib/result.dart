// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int finalRes;
  final VoidCallback resetQuiz;
  Results(this.finalRes, this.resetQuiz);

  String get resultPhrase {
    var resultText;
    if (finalRes <= 8) {
      resultText = 'Good boy';
    } else if (finalRes <= 12) {
      resultText = 'That\'s is';
    } else if (finalRes <= 16) {
      resultText = 'Awesome';
    } else {
      resultText = 'Not so good';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green, onPrimary: Colors.black),
            // ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(Colors.green),
            //     foregroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: resetQuiz,
            child: Text('Elevated button'),
          ),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.amber),
            onPressed: resetQuiz,
            child: Text('Re-take Quiz'),
          ),
          RaisedButton(
            onPressed: resetQuiz,
            child: Text('Raised Button'),
            textColor: Colors.blue,
            focusColor: Colors.blue,
            hoverColor: Colors.red,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.greenAccent,
                side: BorderSide(color: Colors.indigo)),
            onPressed: resetQuiz,
            child: Text('Outlined button'),
          ),
        ],
      ),
    );
  }
}
