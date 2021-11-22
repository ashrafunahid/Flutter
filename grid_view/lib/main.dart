import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    title: 'GridView Example',
    home: Scaffold(
      body: MyBody2(),
    )));

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 3,
      children: [
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
        Container(
          child: Text("Hi"),
          color: Colors.green,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

class MyBody2 extends StatefulWidget {
  const MyBody2({Key? key}) : super(key: key);

  @override
  _MyBody2State createState() => _MyBody2State();
}

class _MyBody2State extends State<MyBody2> {
  List<int> list = [];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i <= 50; i++) {
      list.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext cxt, int index) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            color: Colors.green,
            child: Text('${list[index]}'),
            alignment: Alignment.center,
          ),
        );
      },
    );
  }
}
