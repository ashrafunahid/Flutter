import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context) => const MyApp(),
      SecondScreen.routeName:(context) =>SecondScreen(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation and Route")),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            // Navigator.pushNamed(context, '/second');
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
            Navigator.pushNamed(context, SecondScreen.routeName, arguments: ScreenArgument('Second Screen', 'Back'));
          },
          child: const Text("Go to next page"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static const routeName = "/second";
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    ScreenArgument args = ModalRoute.of(context)!.settings.arguments as ScreenArgument;
    return Scaffold(
      appBar: AppBar(title: Text(args.title),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text(args.button),
        ),
      ),
    );
  }
}


class ScreenArgument{
  String title;
  String button;

  ScreenArgument(this.title, this.button);
}

