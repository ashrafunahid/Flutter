import 'package:bottom_navigation_bar/call.dart';
import 'package:bottom_navigation_bar/home.dart';
import 'package:bottom_navigation_bar/map.dart';
import 'package:bottom_navigation_bar/message.dart';
import 'package:bottom_navigation_bar/account.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Bottom Navigation Bar',
  home: MyHome(),
));

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var _currentIndex = 2;

  final pages=[
    Message(),
    Call(),
    Home(),
    Map(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        // For backgroundcolor it's required to type fixed
        // backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: "Map", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account", backgroundColor: Colors.blue),
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
    );
  }
}
