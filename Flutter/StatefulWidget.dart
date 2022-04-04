import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Bismillahir Rahmair Rahim",
      home: Scaffold(body: MyApp2()),
    ),
  );
}

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String txt = "";
  @override
  void initState() {
    // TODO: implement initState
    txt = "Statefull Widget Demo";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(txt),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  txt = "Statefull Widget";
                });
              },
              child: Text("Change State"),
          )
        ],
      ),
    );
  }
}

