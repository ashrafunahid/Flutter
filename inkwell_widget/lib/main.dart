import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'InkWell widget demo',
  home: Scaffold(
    appBar: AppBar(title: Text("InkWell widget demo"),),
    body: MyBody(),
  ),
));

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("Inkwell onTap");
      },
      child: Container(
        height: 50,
        width: 100,
        alignment: Alignment.center,
        child: Text("InkWell Input"),
      ),
    );
  }
}
