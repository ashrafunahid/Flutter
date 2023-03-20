import 'package:flutter/material.dart';
import 'app_body.dart';

void main() => runApp(MaterialApp(
  title: 'Flutter Stepper Demo',
  home: Scaffold(
    appBar: AppBar(
      title: Text("Flutter Stepper Demo"),
      centerTitle: true,
    ),
    body: AppBody(),
  ),
));