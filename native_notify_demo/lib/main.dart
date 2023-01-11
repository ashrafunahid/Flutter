import 'package:flutter/material.dart';
import 'package:native_notify/native_notify.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NativeNotify.initialize(
      2411,
      'AFvTyXtYKw2LpvqYOoKcfv',
      'AAAASq7oCX4:APA91bEYbggsUCRScxRnbu8bODKRJYqsEuVEMKaZydcMPGOnpwfALhSUuUAOyHDbFJVvhR31PCEKzToP8aFOZbR6YRfbQr60uMyU5UpLYtXMvkq_3VhMSrHxfvSR8_G7tdjOU7tLrIiy',
      null
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Push Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',),
            Text('$_counter',),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
