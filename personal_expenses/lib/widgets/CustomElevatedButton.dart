import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  String title;
  Function handler;
  CustomElevatedButton(this.title, this.handler);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: handler,
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
        child: Text(title),
    );
  }
}

