import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
      title: 'Row Column Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Row Column Demo"),
        ),
        body: MyBody(),
      )
  ));
}

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("This"),
          Text("Is"),
          Text("Column"),
          Row(
            children: [
              Text("This "),
              Text("is "),
              Text("Row"),
            ],
          ),
        ],
      ),
    );
  }
}
