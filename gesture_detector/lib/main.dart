import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Detector Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Gesture Detector Demo')),
        body: MyBody(),
      ),
    );

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
    return GestureDetector(
      onTap: (){
        print("Gesture Detector");
        var snackBar = SnackBar(content: Text("Gesture Detector OnTap"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      onDoubleTap: (){
        print("Gesture Detector OnDoubleTap");
      },
      child: Container(
        height: 100,
        width: 100,
        color: Colors.black12,
      ),
    );
  }
}

