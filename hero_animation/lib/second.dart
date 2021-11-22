import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation | Second"), centerTitle: true,),
      body: Center(
        child: Container(
          child: Hero(
            tag: 'animation',
            child: Icon(Icons.person, size: 150,),
          ),
        ),
      ),
    );
  }
}
