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
      'answers': ['Black', 'Red', 'Blue', 'Green'],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': ['Dog', 'Cat', 'Snake', 'Tiger'],
    },
    {
      'questionText': 'What is your favorite Country?',
      'answers': ['MY', 'UK', 'US'],
    },
  ];

  var questionIndex = 0;

  void answerQuestion() {
    if (questionIndex < questions.length) {
      print('you have one more question');
    } else {
      print('You did it');
    }

    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My FIrst App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(),
      ),
    );
  }
}
