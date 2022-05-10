import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


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

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(child: Text(_currentIndex.toString(), style: TextStyle(fontSize: 50),),),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Color(0XFFFF6565)),
        ),
        child: CurvedNavigationBar(
          height: 60,
          index: _currentIndex,
          backgroundColor: Colors.transparent,
          onTap: (index){
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            Icon(Icons.mail, size: 25,),
            Icon(Icons.favorite_outlined, size: 25,),
            Icon(Icons.home_filled, size: 25),
            Icon(Icons.support_agent_outlined, size: 25,),
            Icon(Icons.account_circle, size: 25,),
          ],
        ),
      ),
    );
  }
}



