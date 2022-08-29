import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/data.dart';

class ReceiverPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Receiver Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(providerData.value.toString(), style: TextStyle(fontSize: 50)),
          ],
        ),
      ),
    );
  }
}
