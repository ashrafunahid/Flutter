import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Shared Preferances Demo",
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  int _counter = 0;

  increament() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      pref.setInt("Counter", _counter);
    });
  }

  getIncreamentValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _counter = pref.getInt("Counter")??0;
    });
  }

  clearSharedPreferanceIndex() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("Counter");
    setState(() {
      _counter = 0;
    });
  }

  @override
  void initState() {
    getIncreamentValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                clearSharedPreferanceIndex();
              },
              icon: Icon(Icons.clear)),
        ],
        title: Text("Shared Preferances Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Previously You've clicked",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text("$_counter", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),),
            Text("times the button", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          increament();
        },
        child: Icon(Icons.save),
        tooltip: ("Click to increase the value"),
      ),
    );
  }
}


