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
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favorite color ?',
      'answer': ['Black', 'Blue', 'Red', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answer': ['Cat', 'Dog', 'Hamster', 'Rat'],
    },
    {
      'questionText': 'What\'s your favorite instructor',
      'answer': ['Sam', 'Max', 'Tati', 'Bobo'],
    },
  ];
  void _answerTheQuestion() {
    setState(() {
      // _questionIndex < _questions.length - 1
      //     ? _questionIndex++
      //     : _questionIndex = 0;
      _questionIndex++;
    });
    print(_questionIndex);
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
            : Result(),
      ),
    );
  }
}
