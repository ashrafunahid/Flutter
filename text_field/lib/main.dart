import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    title: 'Text Field Demo',
    home: Scaffold(
      appBar: AppBar(title: Text("Text Field Demo")),
      body: MyBody(),
    )
));

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {

  String text = '';
  bool _secure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Please Enter Something',
          hintStyle: TextStyle(fontSize: 15, color: Colors.black26),
          labelText: 'Text Field',
          labelStyle: TextStyle(fontSize: 20, color: Colors.red),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(Icons.account_box_rounded),
          suffixIcon: IconButton(
            icon: Icon(_secure?Icons.remove_red_eye_rounded:Icons.security),
            onPressed: (){
              setState(() {
                _secure = !_secure;
              });
            },
          ),
          errorText: text.isEmpty?'Can not be Empty':null,
        ),
        keyboardType: TextInputType.text,
        obscureText: _secure,
        obscuringCharacter: '*',
        // maxLines: 1,
        // maxLength: 10,
        onChanged: (value){
          text = value;
        },
        onSubmitted: (value){
          setState(() {
            text = value;
          });
          print(value);
        },
      ),
    );
  }
}

