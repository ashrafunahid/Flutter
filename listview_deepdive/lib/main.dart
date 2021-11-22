import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final items = List.generate(100, (counter) => 'Item: $counter');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ListView Deep Dive",
        home: Scaffold(
          appBar: AppBar(
            title: Text('ListView Deep Dive'),
          ),
          body: buildListViews(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.view_list),
                label: 'Basic',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: 'Vertical',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.line_style_rounded),
                label: 'Horizontal',
              ),
            ],
            onTap: (int index) {
              setState(() {
                this.index = index;
              });
            },
          ),
        ));
  }

  Widget buildListViews() {
    if (index == 0) {
      return buildBasicListView();
    } else if (index == 1) {
      return buildVerticalListView();
    } else if (index == 2) {
      return buildHorizontalListView();
    } else {
      return Container();
    }
  }

// Basic ListView Builder
  Widget buildBasicListView() {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AD"),
          ),
          title: Text("Android"),
          subtitle: Text("Android Developer"),
          trailing: Icon(Icons.android_rounded),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: Text("FD"),
          ),
          title: Text("Flutter"),
          subtitle: Text("Flutter Developer"),
          trailing: Icon(Icons.flutter_dash_rounded),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text("iD"),
          ),
          title: Text("iOS"),
          subtitle: Text("iOS Developer"),
          trailing: Icon(Icons.ios_share),
        ),
      ],
    );
  }

// Vertical ListView Builder
  Widget buildVerticalListView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: items.length,
    );
  }

// Horizontal ListView Builder
  Widget buildHorizontalListView() {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          width: 100,
          child: ListTile(
            title: Text(items[index]),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: items.length,
    );
  }
}
