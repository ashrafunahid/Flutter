import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/data.dart';
import 'package:provider_practice/receiver_page.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => Data(),
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Practice',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Practice"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(providerData.value.toString(), style: TextStyle(fontSize: 50),),
            ElevatedButton(
                onPressed: (){
                  providerData.increament();
                },
                child: Text("Click")
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiverPage()));
                },
                child: Text("Go Another Page")
            ),
          ],
        ),
      ),
    );
  }
}

