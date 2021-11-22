import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Container Demo",
        home: Scaffold(
          body: Container(
            width: 200,
            height: 200,
            child: Text("In Container"),
            alignment: Alignment.center,
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.red,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            transform: Matrix4.rotationZ(.5),
          ),
        )
    );
  }
}
