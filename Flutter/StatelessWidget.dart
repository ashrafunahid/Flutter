import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Bismillahir Rahmair Rahim",
      home: Scaffold(body: MyApp()),
    ),
  );
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton("Yes"),
          SizedBox(
            height: 10,
          ),
          CustomButton("Save"),
          SizedBox(
            height: 10,
          ),
          CustomButton("Delete"),
          SizedBox(
            height: 10,
          ),
          CustomButton("No"),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String button_title;
  CustomButton(this.button_title);

  // const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("OnTap");
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.blue,
        ),
        child: Center(child: Text(button_title)),
      ),
    );
  }
}

