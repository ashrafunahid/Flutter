import 'package:animated_bottom_navigation_bar_demo/home.dart';
import 'package:animated_bottom_navigation_bar_demo/location.dart';
import 'package:animated_bottom_navigation_bar_demo/message.dart';
import 'package:animated_bottom_navigation_bar_demo/profile.dart';
import 'package:animated_bottom_navigation_bar_demo/wishList.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

/*
First you need to add below dependencies in pubspec.yaml file
bottom_navy_bar: ^6.0.0
then run flutter pub get in terminal
then use it
 */

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    ));

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPages(),
      bottomNavigationBar: _animatedBottomNavigationBar(),
    );
  }

  Widget _buildPages(){
    switch (index){
      case 1:
        return Message();
      case 2:
        return WishList();
      case 3:
        return Location();
      case 4:
        return Profile();
      case 0:
      default:
        return Home();

    }
  }

  Widget _animatedBottomNavigationBar() {
    return BottomNavyBar(
      // showElevation: true,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      itemCornerRadius: 10,
      backgroundColor: Colors.white,
      iconSize: 25.0,
      selectedIndex: index,
      onItemSelected: (index) {
        setState(() {
          this.index = index;
        });
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home_filled),
          title: Text("Home"),
          textAlign: TextAlign.center,
          activeColor: Color(0XFFFF6565),
          inactiveColor: Color(0XFFBCBCBC),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.mail),
          title: Text("Message"),
          textAlign: TextAlign.center,
          activeColor: Color(0XFFFF6565),
          inactiveColor: Color(0XFFBCBCBC),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.favorite_outlined),
          title: Text("Wish List"),
          textAlign: TextAlign.center,
          activeColor: Color(0XFFFF6565),
          inactiveColor: Color(0XFFBCBCBC),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.support_agent_outlined),
          title: Text("Support"),
          textAlign: TextAlign.center,
          activeColor: Color(0XFFFF6565),
          inactiveColor: Color(0XFFBCBCBC),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("Profile"),
          textAlign: TextAlign.center,
          activeColor: Color(0XFFFF6565),
          inactiveColor: Color(0XFFBCBCBC),
        ),
      ],
    );
  }
}
