import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Custom Scroll View',
  home: MyHome(),
));

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
        slivers: [
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver App Bar'),
              centerTitle: true,
              background: Hero(tag: 'imageTagName', child: Image.network('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', fit: BoxFit.cover,)),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 10,),
                Text('This is an Image', style: TextStyle(color: Colors.grey, fontSize: 20), textAlign: TextAlign.center,),
                SizedBox(height: 10,),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Image Description", textAlign: TextAlign.center, softWrap: true,)
                ),
                SizedBox(height: 800,),
              ]),
          ),
        ],
      ),
    );
  }
}
