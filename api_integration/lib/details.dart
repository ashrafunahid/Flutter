import 'package:flutter/material.dart';

class DetailProfile extends StatelessWidget {

  var receivedData;
  DetailProfile({this.receivedData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.network(receivedData["avatar"]),
        ),
      ),
    );
  }
}
