import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card Widget',
      home: Scaffold(
        appBar: AppBar(title: Text("Card Widget"),),
        body: MyBody(),
      )
  ));
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // For Box Shadow
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.red,
            width: 2,
          )
      ),
      child: Container(
        height: 300,
        width: 300,
      ),
    );
  }
}

