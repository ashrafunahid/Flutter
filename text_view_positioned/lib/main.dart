import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Text View Positioned',
  home: StackDemo(),
));

class StackDemo extends StatefulWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  _StackDemoState createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/network-img.jpg'),
                fit: BoxFit.fitHeight,
              )
          ),
        ),

        Positioned(
          bottom: 40,
          left: 10,
          right: 10,
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('New York',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    textAlign: TextAlign.justify,),
                ),
              ],
            ),
          ),
        )

        // Container(
        //   width: 200,
        //   height: 200,
        //   color: Colors.blue,
        // ),

        // Positioned(
        //   top: 60,
        //   right: 20,
        //   child: Container(
        //     width: 100,
        //     height: 100,
        //     color: Colors.pink,
        //   ),
        // ),
      ],
    );
  }
}



