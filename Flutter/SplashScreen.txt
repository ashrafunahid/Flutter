import 'dart:async';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: SplashScreen(),
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSplashScreen();

  }

  Future<Timer> loadSplashScreen() async{
    return new Timer(Duration(seconds: 5), onDoneSplashScreen);
  }
  onDoneSplashScreen() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/qr.png'),
        ),
      ),
      // child: Center(
      //   child: CircularProgressIndicator(
      //     valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      //   ),
      );
  }
}


// Main Screen
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Demo',
      home: Scaffold(
        appBar: AppBar(title: Text("Splash Screen Demo"), centerTitle: true,),
        body: Center(
          child: Container(
            child: Text("This is Main Screen"),
          ),
        ),
      ),
    );
  }
}

