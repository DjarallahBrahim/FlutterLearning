import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final VoidCallback _answerTheQuestion;
  final List<Map<String, Object>> _questions;
  final int _questionIndex;
  Quiz(this._questions, this._answerTheQuestion, this._questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          _questions[_questionIndex]['questionText'] as String,
        ),
        ...(_questions[_questionIndex]['answer'] as List<String>)
            .map((answer) => Answer(_answerTheQuestion, answer))
            .toList(),
      ],
    );
  }
}
