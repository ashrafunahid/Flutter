import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  var _currentIndex = 0;
  bool _isDrawerVisible = false;

  var pages = [
    Container(color: Colors.green,),
    Container(color: Colors.blue,),
    Container(color: Colors.teal,),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 350),
      top: _isDrawerVisible==false?0:100,
      bottom: _isDrawerVisible==false?0:100,
      left: _isDrawerVisible==false?0:200,
      right: _isDrawerVisible==false?0:-100,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Custom Navigation Drawer with Animation"),
            centerTitle: true,
            leading: _isDrawerVisible == false? IconButton(
              onPressed: (){
                setState(() {
                  _isDrawerVisible = true;
                });
              },
              icon: Icon(Icons.menu),
            ):IconButton(
                onPressed: (){
                  setState(() {
                    _isDrawerVisible = false;
                  });
                },
                icon: Icon(Icons.close)),
          ),
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value){
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Message"),
              BottomNavigationBarItem(icon: Icon(Icons.inventory), label: "Inventory"),
            ],
          ),
        ),
      ),
    );
  }
}
