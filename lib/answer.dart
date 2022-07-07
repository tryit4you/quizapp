import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answer;
  Answer(this.selectHandler, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, child: answerWidget());
  }

  Widget answerWidget() {
    print(this.selectHandler.toString());
    return RaisedButton(
        color: Color.fromRGBO(5, 56, 98, 1),
        onPressed: selectHandler,
        child: Text(
          answer,
          style: TextStyle(color: Colors.white),
        ));
  }
}
