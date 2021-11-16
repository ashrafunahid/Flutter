import 'package:flutter/material.dart';

void main() => runApp(const MyHome());

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Deep Dive',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 30, //shadow
          shadowColor: Colors.green,
          toolbarOpacity: .9,
          // toolbarHeight: 70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          leading: Icon(Icons.menu),
          title: Text("AppBar Deep Dive"),
          centerTitle: true,
          actions: [
            Container(padding: EdgeInsets.all(5),child: Icon(Icons.person)),
            Container(padding: EdgeInsets.all(5),child: Icon(Icons.search)),
            Container(padding: EdgeInsets.all(5),child: Icon(Icons.more_vert)),
          ],
          bottom: TabBar(

            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: 'Person',
              ),
              Tab(
                icon: Icon(Icons.card_travel),
                text: 'Travel',
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
                text: 'Shopping',
              ),
            ],
          ),
        ),

        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text("Person")),
            Center(child: Text("Travel")),
            Center(child: Text("Shopping")),
          ],
        ),
      ),
    );
  }
}
