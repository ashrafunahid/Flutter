import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flash Light App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.flashlight_on),
                  iconSize: 50,
                  onPressed: () {
                    TorchCompat.turnOn();
                  }),
              IconButton(
                icon: Icon(Icons.flashlight_off),
                  iconSize: 50,
                  onPressed: () {
                    TorchCompat.turnOff();
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Mandatory for Camera 1 on Android
    TorchCompat.dispose();
    super.dispose();
  }
}