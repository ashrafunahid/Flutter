import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: MyBody(),
        ));
  }
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: -25,
            left: -25,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
