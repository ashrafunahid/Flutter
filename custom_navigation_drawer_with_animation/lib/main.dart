import 'package:custom_navigation_drawer_with_animation/custom_drawer.dart';
import 'package:custom_navigation_drawer_with_animation/main_home_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomDrawer(),
          MainHomeScreen(),
        ],
      ),
    );
  }
}


