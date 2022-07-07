import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  double _totalScore = 0;
  final _question = const [
    {
      'question': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Red', 'score': 4, 'flag': 1},
        {'text': 'Green', 'score': 1, 'flag': 0},
        {'text': 'Blue', 'score': 1, 'flag': 0},
        {'text': 'Orange', 'score': 1, 'flag': 0}
      ]
    },
    {
      'question': 'What\'s your favorite fruit?',
      'answer': [
        {'text': 'Apple', 'score': 2, 'flag': 0},
        {'text': 'Banana', 'score': 5, 'flag': 1},
        {'text': 'Kiwi', 'score': 1, 'flag': 0},
        {'text': 'Watermelon', 'score': 3, 'flag': 0}
      ]
    }
  ];
  void _answerQuestion(int score, int flag) {
    _totalScore += score;
    if (flag >= 1)
      print('Corect!');
    else
      print('InCorrect!');
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QuizApp',
        home: Scaffold(
          appBar: AppBar(title: Text('Quiz App')),
          body: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: _questionIndex < _question.length
                ? Quiz(
                    question: _question,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                  )
                : Result(this._totalScore, this._resetQuiz),
          ),
        ));
  }
}
