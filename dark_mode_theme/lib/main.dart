import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Dark Mode Theme Demo',
  theme: ThemeData(
    primarySwatch: Colors.pink,
    brightness: Brightness.dark,
  ),
  home: Scaffold(
    appBar: AppBar(title: const Text("Dark Mode Theme Demo")),
    body: const MyBody(),
  ),
));

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
