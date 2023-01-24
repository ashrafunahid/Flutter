import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is Second Page"),
      ),
    );
  }
}
