import 'package:flutter/material.dart';

import 'answers.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionsList;
  final Function answerQuestions;
  final int index;

  Quiz({
    required this.questionsList,
    required this.answerQuestions,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(
          questionsList[index]['questionText'] as String,
        ),
        ...(questionsList[index]['Answers'] as List<Map<String, Object>>)
            .map((e) {
          return Answer(() => answerQuestions(e['score']), e['text'] as String);
        }).toList(),
      ],
    );
  }
}
