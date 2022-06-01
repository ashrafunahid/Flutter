import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  Future _exitApp(context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Are you sure want to close this app?"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No"),
                ),
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                    exit(0);
                  },
                  child: Text("Yes"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        _exitApp(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Close App With Alert Dialog"), centerTitle: true,),
        body: Center(child: Text("Press back button to show alert dialog")),
      ),
    );
  }
}


