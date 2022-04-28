import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Screen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Next Screen", style: TextStyle(fontSize: 22, color: Colors.red),),
            Text("Parameter is ${Get.parameters['someValue']}", style: TextStyle(fontSize: 22, color: Colors.red),),
          ],
        ),
      ),
    );
  }
}
