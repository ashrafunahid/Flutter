import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_navigation/home.dart';
import 'package:getx_route_navigation/next.dart';
import 'package:getx_route_navigation/unknown_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Route Navigation with Name',
      initialRoute: "/",
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/home', page: () => MyHome()),
        // GetPage(name: '/nextScreen', page: () => NextScreen(), transition: Transition.rightToLeft),
        GetPage(name: '/nextScreen/:someValue', page: () => NextScreen(), transition: Transition.rightToLeft),
      ],
      unknownRoute: GetPage(name: "/notfound", page: () => UnknownRoute()),
      home: Scaffold(
        appBar: AppBar(title: Text("Route Navigation with Name"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Get.to(
                  //   MyHome(),
                  //   // To show as a full screen dialog
                  //   fullscreenDialog: true,
                  //   // To animate the navigation screen with duration
                  //   transition: Transition.zoom,
                  //   duration: Duration(milliseconds: 1000),
                  // );
                  // Go to next screen finally, No option for get back
                  // Get.off(MyHome());
                  // Go to next screen and cancel all previous page
                  // Get.offAll(MyHome());
                  // Go to next screen with arguments / data
                  // Get.to(MyHome(), arguments: "Arguments from Main Screen");
                  // var data = await Get.to(MyHome());
                  // print("Received data is $data");
                  // Get.toNamed("/home");
                  // Go to next screen finally, No option for get back
                  // Get.offNamed("/home");
                  // Go to next screen with arguments / data
                  Get.toNamed("/home?name=Ashraf uddin&email=ashrafuanhid@gmail.com");
                },
                child: Text("Go to Home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
