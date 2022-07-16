import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questionList = const [
    {
      'questionText': 'Is Flutter is a programming language?',
      'answers': [
        {'text': 'Yes', 'scores': 0},
        {'text': 'No', 'scores': 10},
        {'text': 'Maybe', 'scores': 0},
        {'text': 'Yes', 'scores': 0},
      ]
    },
    {
      'questionText': 'What is your favourite programming language?',
      'answers': [
        {'text': 'Python', 'scores': 10},
        {'text': 'Dart', 'scores': 20},
        {'text': 'Java', 'scores': 30},
        {'text': 'PHP', 'scores': 5},
      ]
    },
    {
      'questionText': 'Which IDE will you suggest for Flutter development?',
      'answers': [
        {'text': 'Android Studio', 'scores': 20},
        {'text': 'Visual Studio Code', 'scores': 5},
        {'text': 'IntelliJ', 'scores': 10},
      ]
    },
    {
      'questionText': 'Which programming language does Flutter use?',
      'answers': [
        {'text': 'Python', 'scores': 0},
        {'text': 'Dart', 'scores': 10},
        {'text': 'Java', 'scores': 0},
        {'text': 'PHP', 'scores': 0},
      ]
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
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questionList.length) {
      print("More Questions");
    } else {
      print("No More Questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        body: _questionIndex < _questionList.length
            ? Quiz(
                questions: _questionList,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
