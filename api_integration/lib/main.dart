import 'dart:convert' as convert;

import 'package:api_integration/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
  MaterialApp(
    title: 'API Integration',
    home: MyHome(),
  ),
);

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  var data;

  Future getData()async{
    var url = Uri.parse('https://reqres.in/api/users?page');
    var response = await http.read(url);
    setState(() {
      var decode = convert.jsonDecode(response);
      data = decode['data'];
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
    return Scaffold(
      body: ListView.builder(
        itemCount: data==null?0:data.length,
          itemBuilder: (context, index){
          return ListTile(
            leading: CircleAvatar(child: Text(data[index]["id"].toString())),
            title: Text(data[index]["first_name"]+" "+data[index]["last_name"]),
            subtitle: Text(data[index]["email"]),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProfile(receivedData: data[index])));
            },
          );
          },
      ),
    );
  }
}
