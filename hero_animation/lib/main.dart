import 'package:flutter/material.dart';
import 'second.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hero Animation',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation | Main"), centerTitle: true,),
      body: Center(
        child: GestureDetector(
          child: Hero(
            tag: 'animation',
            child: Container(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.add, size: 50,),
              ),
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Second()));
          },
        ),
      ),
    );
  }
}



