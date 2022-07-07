import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({this.question, this.answerQuestion, this.questionIndex});
  @override
  Widget build(BuildContext context) {
    final answer = question[questionIndex]['answer'];
    return Column(
      children: [
        Question(question[questionIndex]['question'] as String),
        ...(answer as List<Map<String, Object>>)
            .map((answer) => Answer(
                () => answerQuestion(answer['score'], answer['flag']),
                answer['text']))
            .toList()
      ],
    );
  }
}
