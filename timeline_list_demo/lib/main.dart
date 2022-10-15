import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

void main() {
  runApp(MaterialApp(
    title: 'Timeline List',
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline List'),
      ),
      body: Timeline(
        children: <TimelineModel>[
          TimelineModel(
            Container(
              height: 100,
              child: Center(
                child: Text("data"),
              ),
            ),
            icon: Icon(Icons.receipt, color: Colors.white),
            iconBackground: Colors.blue,
          ),
          TimelineModel(
            Container(
              height: 100,
              child: Center(
                child: Text("data"),
              ),
            ),
            icon: Icon(Icons.android),
            iconBackground: Colors.cyan,
          ),
          TimelineModel(
            Container(
              height: 100,
              child: Center(
                child: Text("data"),
              ),
            ),
            icon: Icon(Icons.receipt, color: Colors.white),
            iconBackground: Colors.blue,
          ),
          TimelineModel(
            Container(
              height: 100,
              child: Center(
                child: Text("data"),
              ),
            ),
            icon: Icon(Icons.receipt, color: Colors.white),
            iconBackground: Colors.blue,
          ),
        ],
        position: TimelinePosition.Center,
        iconSize: 40,
        lineColor: Colors.blue,
      ), //TimelinePage(title: 'Muslim Civilisation Doodles'),
    );
  }
}
