import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text("Making a Call or an Email"),centerTitle: true,),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                launchUrl(Uri(scheme: "tel", path: "01819984713"));
              },
              child: Text("Click to Call")
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber("01819984713");
              },
              child: Text("Click to Direct Call")
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                launchUrl(Uri(scheme: "mailto", path: "ashrafunahid@gmail.com?subject=Test Subject&body=Test Message Body"));
              },
              child: Text("Click to mail")
          ),
        ],
      ),
    );
  }
}

