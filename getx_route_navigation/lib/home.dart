import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_navigation/next.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Get.toNamed("/nextScreen/1234");
            }, child: Text("Go to Next")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                  // To send data to previous screen
                  Get.back(result: 'Message from home Screen');
                },
                child: Text("Go to Back")),
            // Text(
            //   "${Get.arguments}",
            //   style: TextStyle(fontSize: 18, color: Colors.red),
            // ),
            Text(
              "Name is ${Get.parameters['name']} and email id is ${Get.parameters['email']}",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
