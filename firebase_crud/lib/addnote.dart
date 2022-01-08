import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  CollectionReference referance =
      FirebaseFirestore.instance.collection('contacts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              referance.add({
                'name': name.text,
                'number': number.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyHome()));
              });
            },
            child: Text("Save"),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: number,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: "Number"),
            ),
          ],
        ),
      ),
    );
  }
}
