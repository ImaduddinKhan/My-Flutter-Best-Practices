// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:quizz_app/quiz.dart';
import 'package:quizz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav toy',
      'Answers': [
        {'text': 'Lego b-man', 'score': 10},
        {'text': 'Lego i-man', 'score': 5},
        {'text': 'Lego s-man', 'score': 3},
        {'text': 'Lego a-man', 'score': 2}
      ],
    },
    {
      'questionText': 'what\'s your fav fruit',
      'Answers': [
        {'text': 'Peach', 'score': 1},
        {'text': 'Mango', 'score': 8},
        {'text': 'Fig', 'score': 10},
        {'text': 'Orange', 'score': 6}
      ],
    },
    {
      'questionText': 'what\'s your fav season',
      'Answers': [
        {'text': 'Summer', 'score': 1},
        {'text': 'Winter', 'score': 3},
        {'text': 'Spring', 'score': 10},
        {'text': 'Autumn', 'score': 15},
      ],
    },
  ];

  var _questionInd = 0;
  var _finalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionInd = 0;
      _finalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _finalScore += score;

    setState(() {
      _questionInd = _questionInd + 1;
    });
    print(_questionInd);
    if (_questionInd < _questions.length) {
      print('We could have more questions');
    } else {
      print('No more Questions ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MY FIRST APP'),
        ),
        body: _questionInd < _questions.length
            ? Quiz(
                questionsList: _questions,
                answerQuestions: _answerQuestion,
                index: _questionInd,
              )
            : Results(_finalScore, _resetQuiz),
      ),
    );
  }
}
