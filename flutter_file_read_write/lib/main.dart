import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import '3dviewer.dart';
// import 'copy_paste.dart';
import 'file_read_write.dart';
// import 'form_builder.dart';

void main() {
  runApp(MaterialApp(home: FileOperationsScreen(),));
}

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  GlobalKey _scaffold_key=new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("First Screen"),
        ),
        key: _scaffold_key,
        body: Container(
          child: Center(
            child: RaisedButton(onPressed: (){
             Navigator.push(_scaffold_key.currentContext, MaterialPageRoute(builder: (con){
               return Scaffold(
                 appBar: AppBar(
                   title: Text("Second Screen"),
                 ),
                 body: Container(
                   child: Center(
                     child: RaisedButton(onPressed: (){
                       SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                     },child: Text("Close App"),),
                   ),
                 ),
               );
             }));
            },child: Text("Second Screen"),),
          ),
        ),
      ),
    );
  }
}*/


