import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void showToast(){
    Fluttertoast.showToast(
        msg: 'Flutter Toast Notification Demo',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      fontSize: 18.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Toast Message Demo"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              showToast();
            },
            child: Text("Show Toast"),
          ),
        ),
      ),
    );
  }
}

