import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyBody(),
  ));
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.animation),
        onPressed: (){
          setState(() {
            _isClicked = !_isClicked;
          });
        },
      ),
      body: Center(
        child: AnimatedContainer(
          height: _isClicked == false ? 150 : 200,
          width: _isClicked == false ? 150 : 200,
          color: Colors.blue,
          duration: Duration(milliseconds: 400),
        ),
      ),
    );
  }
}

