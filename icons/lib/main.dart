import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon Widget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text("Icon Widget"),),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {

  int volume = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.black12,
        child: Column(
          children: [
            Icon(Icons.volume_up, size: 50, color: Colors.blue),
            IconButton(
              icon: Icon(Icons.volume_up, size: 50, color: Colors.red),
              onPressed: (){
                setState(() {
                  volume = volume + 1;
                });
              },
            ),
            Text('$volume', style: TextStyle(fontSize: 40),),
            IconButton(
              icon: Icon(Icons.volume_down, size: 50, color: Colors.red),
              onPressed: (){
                setState(() {
                  volume = volume - 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

