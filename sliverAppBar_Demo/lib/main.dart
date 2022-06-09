import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:<Widget> [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver App Bar Title"),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  addDelegate("One", "Delegate number One"),
                  addDelegate("Two", "Delegate number Two"),
                  addDelegate("Three", "Delegate number Three"),
                  addDelegate("Four", "Delegate number Four"),
                  addDelegate("Five", "Delegate number Five"),
                  addDelegate("Six", "Delegate number Six"),
                  addDelegate("Seven", "Delegate number Seven"),
                  addDelegate("Eight", "Delegate number Eight"),
                  addDelegate("Nine", "Delegate number Nine"),
                  addDelegate("Ten", "Delegate number Ten"),
                  addDelegate("Eleven", "Delegate number Eleven"),
                  addDelegate("Twelve", "Delegate number Twelve"),
                  addDelegate("Thirteen", "Delegate number Thirteen"),
                  addDelegate("Fourteen", "Delegate number Fourteen"),
                  addDelegate("Fifteen", "Delegate number Fifteen"),
                ]
              ),
          ),
        ],
      ),
    );
  }
  Widget addDelegate(String title, String sub_title){
    return ListTile(
      leading: CircleAvatar(
        child: Text(title[0]),
      ),
      title: Text(title),
      subtitle: Text(sub_title),
    );
  }
}


