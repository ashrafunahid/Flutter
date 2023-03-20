import 'package:flutter/material.dart';
import 'swipeable_list_view.dart';

void main() => runApp(MaterialApp(
  title: "Swipeable ListView",
  home: Scaffold(
    appBar: AppBar(
      title: Text("Swipeable ListView"),
      centerTitle: true,
    ),
    body: SwipeableListView(),
  ),
));