import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
        title: 'Text.rich Demo',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Scaffold(
          appBar: AppBar(title: Text('Text and Text.rich Demo')),
          body: MyBody(),
        )
    )
);

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 300,
          color: Colors.black12,
          padding: EdgeInsets.all(10),
          child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              // textScaleFactor: 1.5,
              textAlign: TextAlign.justify,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 5,
              style: TextStyle(
                decoration: TextDecoration.underline,
                letterSpacing: 1.0,
              )
          ),
        ),
        Container(
          width: 300,
          height: 100,
          color: Colors.black26,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          child: Text.rich(
              TextSpan(
                text: 'Lorem Ipsum ',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'is simply dummy text of the printing and typesetting industry. ',
                    style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal),
                  ),
                ],
              )
          ),
        )
      ],
    );
  }
}
