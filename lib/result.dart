import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double totalScore;
  final VoidCallback _resetHandler;
  const Result(this.totalScore, this._resetHandler);
  String get resultPhrase {
    String textResult;
    if (totalScore <= 5) {
      textResult = 'Your are so bad';
    } else if (totalScore <= 8) {
      textResult = 'Your are badman';
    } else {
      textResult = 'Your are supperman';
    }

    return textResult;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            this.resultPhrase,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
              onPressed: _resetHandler,
              color: Colors.blue,
              child: Text(
                'Reset Quiz',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
