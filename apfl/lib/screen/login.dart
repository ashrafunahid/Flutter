import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/LoginResponseModel.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text("APFL FarmVisit"),
      centerTitle: true,
    );
    var _height = ((MediaQuery.of(context).size.height - appBar.preferredSize.height) - MediaQuery.of(context).padding.top);
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text("Email"),
              ),
              onChanged: (value){
                username = value;
              },
            ),
            SizedBox(height: _height * .02,),
            TextField(
              decoration: InputDecoration(
                label: Text("Password"),
              ),
              onChanged: (value){
                password = value;
              },
            ),
            SizedBox(height: _height * .02,),
            ElevatedButton(onPressed: (){
              _login(username, password);
            }, child: Text("Login")),
          ],
        ),
      ),
    );
  }

  Future<void> _login(String username, String password) async {
    Uri uri = Uri.parse("https://farmvisitapi.butsbd.com/api/Auth/Login");

    final map = {
      'username': username,
      'password': password,
    };

    final response = await post(
        uri,
        body: json.encode(map),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      encoding: Encoding.getByName("utf-8"),
    );
    if(response.statusCode == 200){
      final loginResponse = jsonDecode(response.body);
      LoginResponseModel model = LoginResponseModel.fromJson(loginResponse);
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('Bearer', model.data.toString());
      print(pref.getString('Bearer'));
    }
  }

}
