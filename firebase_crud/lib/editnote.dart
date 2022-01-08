import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class EditNote extends StatefulWidget {
  DocumentSnapshot docid;

  EditNote({required this.docid});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    name = TextEditingController(text: widget.docid.get('name'));
    number = TextEditingController(text: widget.docid.get('number'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'name': name.text,
                'number': number.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyHome()));
              });
            },
            child: Text("Save"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyHome()));
              });
            },
            child: Text("Delete"),
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
