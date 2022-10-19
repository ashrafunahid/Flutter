import 'package:flutter/material.dart';

import 'screens/auto_complete_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search with suggestion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AutoCompleteExample(title: 'Search with Suggestion'),
    );
  }
}

