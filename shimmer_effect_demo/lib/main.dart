import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;

  Future getData() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.read(url);
    print(response);
    setState(() {
      var decode = convert.jsonDecode(response);
      data = decode['products'];
      print(data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      title: Text('Shimmer Effect'),
    );
    var _height =
        ((MediaQuery.of(context).size.height - _appBar.preferredSize.height) -
            MediaQuery.of(context).padding.top);
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: _width,
              height: _height * .10,
              child: Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: Text(
                  'Shimmer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: _height * .90,
              width: _width,
              child: ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            data[index]['thumbnail'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )),
                      title: Text(
                        data[index]['title'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data[index]['description']),
                      trailing: Text(
                        data[index]['price'].toString() + ' \$',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
