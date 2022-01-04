import 'package:flutter/material.dart';
import 'navigation_drawer.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Favourite Page"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text("Favourite Page"),
      ),
    );
  }
}
