import 'package:flutter/material.dart';
import 'navigation_drawer.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Navigatin Drawer",
      home: MyHome(),
    ));

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Navigatin Drawer"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("This is home page"),
      ),
    );
  }
}
