import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 3}
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'tiger', 'score': 10},
        {'text': 'cat', 'score': 5},
        {'text': 'Dog', 'score': 7},
        {'text': 'rat', 'score': 3}
      ],
    },
    {
      'questionText': 'What is your favorite Country?',
      'answers': [
        {'text': 'MY', 'score': 10},
        {'text': 'IND', 'score': 5},
        {'text': 'UK', 'score': 7},
        {'text': 'US', 'score': 3}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < questions.length) {
      print('you have one more question');
    } else {
      print('You did it');
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My FIrst App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
