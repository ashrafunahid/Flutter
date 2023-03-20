import 'package:flutter/material.dart';

class SwipeableListView extends StatefulWidget {
  @override
  State<SwipeableListView> createState() => _SwipeableListViewState();
}

class _SwipeableListViewState extends State<SwipeableListView> {
  List list = List.generate(30, (index) => "Item - ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(list[index]),
            onDismissed: (item) {
              setState(() {
                list.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(list[index]),
            ),
            background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
