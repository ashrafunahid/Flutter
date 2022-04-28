import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unknown Route"),),
      body: Center(
        child: Text("Unknown Route"),
      ),
    );
  }
}
