import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView and ListTile Demo",
      home: Scaffold(
          appBar: AppBar(
            title: Text("ListView and ListTile Demo"),
          ),
          body: ListView(
            children: [
              ListTile(
                title: Text("Item No 1"),
                leading: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    )
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text("Item No 2"),
                leading: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    )
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text("Item No 3"),
                leading: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    )
                ),
                trailing: Icon(Icons.arrow_forward),
              )
            ],
          )
      ),
    );
  }
}
