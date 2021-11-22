import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'ListViewBuilder Example',
      home: Scaffold(
        appBar: AppBar(title: Text("ListView.builder Demo"),),
        body: MyApp(),
      )
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> list = [];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i <= 50; i++) {
      list.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext cnx, int index) {
          return ListTile(
            title: Text("Item No ${list[index]}"),
            leading: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                )),
            trailing: Icon(Icons.arrow_forward),
          );
        });
  }
}
