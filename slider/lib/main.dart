import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: MyBody(),
    ),
  ));
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {

  var _FontSize = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This is a Text", style: TextStyle(fontSize: _FontSize),),
        Slider(
          min: 10.0,
            max: 50.0,
            value: _FontSize,
            onChanged: (value){
            setState(() {
              _FontSize = value;
              print(_FontSize);
            });
            },
        ),
      ],
    );
  }
}

