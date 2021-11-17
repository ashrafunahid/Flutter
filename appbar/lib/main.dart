import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBar Deep Dive',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 50,
          shadowColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          leading: Icon(Icons.menu),
          title: Text("AppBar Deep Dive"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.person),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  print("Searchig something");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.more_vert),
            ),
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
                text: 'Cart',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text("Person Tab")),
            Center(child: Text("Travel Tab")),
            Center(child: Text("Shopping Tab")),
          ],
        )
      ),
    );
  }
}
