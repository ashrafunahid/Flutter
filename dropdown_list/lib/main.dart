import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String txt = "Unselected";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(txt, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          DropdownButton(
            elevation: 15,
              icon: Icon(Icons.arrow_drop_down_circle_rounded),
              items: [
                DropdownMenuItem(child: Text("Option-1"), value: "Option-1",),
                DropdownMenuItem(child: Text("Option-2"), value: "Option-2",),
                DropdownMenuItem(child: Text("Option-3"), value: "Option-3",),
              ],
              onChanged: (val){
                setState(() {
                  txt = val as String;
                });
              }
          ),
        ],
      ),
    );
  }
}
