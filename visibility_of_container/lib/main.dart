import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: MyHome(),
    ),
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(
            maintainSize: true,
            visible: isVisible,
            maintainAnimation: true,
            maintainState: true,
            maintainInteractivity: true,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.lightBlueAccent,
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              this.isVisible = !isVisible;
            });
          }, child: Text(isVisible == true ? "Hide" : "Show")),
        ],
      ),
    );
  }
}
