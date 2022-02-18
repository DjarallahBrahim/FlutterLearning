// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fullet_guide_application/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favorite color ?',
      'answer': [
        {
          'text': 'Black',
          'score': 5,
        },
        {
          'text': 'Blue',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 8,
        },
        {
          'text': 'White',
          'score': 2,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answer': [
        {
          'text': 'Dog',
          'score': 3,
        },
        {
          'text': 'Hamster',
          'score': 9,
        },
        {
          'text': 'Cat',
          'score': 5,
        },
        {
          'text': 'Rat',
          'score': 4,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor',
      'answer': [
        {
          'text': 'Sam',
          'score': 10,
        },
        {
          'text': 'Jemi',
          'score': 0,
        },
        {
          'text': 'Rami',
          'score': 1,
        },
        {
          'text': 'Rof',
          'score': 9,
        }
      ],
    },
  ];
  void _answerTheQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyFirstApp"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerTheQuestion, _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
