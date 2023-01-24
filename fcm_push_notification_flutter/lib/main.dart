import 'package:fcm_push_notification_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

// https://blog.logrocket.com/add-flutter-push-notifications-firebase-cloud-messaging/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Notify',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}