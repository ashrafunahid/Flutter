import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart' show Data, user_model;

class AutoCompleteExample extends StatefulWidget {

  final String? title;
  AutoCompleteExample({this.title});

  @override
  State<AutoCompleteExample> createState() => _AutoCompleteExampleState();
}

class _AutoCompleteExampleState extends State<AutoCompleteExample> {
  user_model? userModel;
  void _getDataFromApi() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

    setState(() {
      userModel = user_model.fromJson(json.decode(response.body));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title as String),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Autocomplete<Data>(
          optionsBuilder: (TextEditingValue value){
            if(value.text.isEmpty){
              return List.empty();
            }
            return userModel!.data!.where((element) => element.firstName!.toLowerCase().contains(value.text.toLowerCase())).toList();
          },
          fieldViewBuilder: (BuildContext context, TextEditingController textController, FocusNode node, Function onSubmit){
            return TextField(
              controller: textController,
              focusNode: node,
              decoration: InputDecoration(
                hintText: 'Type to search'
              ),
            );
          },
          displayStringForOption: (Data d) => d.firstName! + ' ' +d.lastName!,
          onSelected: (value) => print(value.id),
          optionsViewBuilder: (BuildContext context, Function onSelect, Iterable<Data> dataList){
            return Material(
              child: ListView.builder(
                itemCount: dataList.length,
                  itemBuilder: (context, index){
                  Data d = dataList.elementAt(index);
                  return InkWell(
                    onTap: () => onSelect(d),
                    child: ListTile(
                      title: Text(d.firstName.toString()),
                      leading: Image.network(d.avatar!, height: 50, width: 50, fit: BoxFit.fill,),
                    ),
                  );
                  }
              ),
            );
          },
        ),
      ),
    );
  }
}
