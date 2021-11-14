import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Button Demo',
  theme: ThemeData(
    primarySwatch: Colors.pink,
    // brightness: Brightness.dark,
  ),
  home: Scaffold(
    appBar: AppBar(title: const Text("Button Demo")),
    body: const MyBody(),
  ),
));

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {

  String dat = "A text without pressing any button";
  final isSelected = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dat, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          TextButton(
            onPressed: (){
              setState(() {
                dat = "Pressed Text Button";
              });
            },
            child: const Text("Text Button"),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                dat = "Pressed Elevated Button";
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.cloud_upload),
                Text(" Elevated Button"),
              ],
            ),
          ),
          OutlinedButton(
              onPressed: (){
                setState(() {
                  dat = "Pressed Outline Button";
                });
              },
              child: const Text("Outline Button", style: TextStyle(color: Colors.blue),)
          ),
          ToggleButtons(
            children: const <Widget>[
              Icon(Icons.call),
              Icon(Icons.dialpad),
              Icon(Icons.call_end),
            ],
            onPressed: (int index){
              if(index == 0){
                isSelected[index] = !isSelected[index];
                isSelected[index+1] = false;
                isSelected[index+2] = false;
                setState(() {
                  dat = "Phone Toggle Button Clicked";
                });
              }
              else if(index == 1){
                isSelected[index-1] = false;
                isSelected[index] = !isSelected[index];
                isSelected[index+1] = false;
                setState(() {
                  dat = "Keypad Toggle Button Clicked";
                });
              }
              else if(index == 2){
                isSelected[index-1] = false;
                isSelected[index-2] = false;
                isSelected[index] = !isSelected[index];
                setState(() {
                  dat = "End Call Toggle Button Clicked";
                });
              };
            },
            isSelected: isSelected,
          ),
          IconButton(
            onPressed: (){
              setState(() {
                dat = "Icon Button Pressed";
              });
            },
            icon: const Icon(Icons.smart_button),
            iconSize: 100,
            splashColor: Colors.blue,
            splashRadius: 30,
            hoverColor: Colors.red,
            tooltip: "This is Icon Button",
            autofocus: true,
          ),
        ],
      ),
    );
  }
}
