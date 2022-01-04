import 'package:flutter/material.dart';
import 'navigation_drawer.dart';

class PeopleView extends StatefulWidget {
  const PeopleView({Key? key}) : super(key: key);

  @override
  _PeopleViewState createState() => _PeopleViewState();
}

class _PeopleViewState extends State<PeopleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("People Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("People Page"),
      ),
    );
  }
}
