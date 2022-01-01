import 'package:flutter/material.dart';
import 'package:navigation_drawer/navigation_drawer_widget.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('People Page'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
