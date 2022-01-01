import 'package:flutter/material.dart';
import 'navigation_drawer_widget.dart';

void main() => runApp(MaterialApp(
  title: 'Flutter Navigation Drawer',
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
      appBar: AppBar(title: Text("Navigation Drawer")),
    );
  }
}
