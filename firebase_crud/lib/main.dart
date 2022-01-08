import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/addnote.dart';
import 'package:firebase_crud/editnote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase CRUD',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection("contacts").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddContact()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Firebase CRUD"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Somethin Wrong.");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EditNote(docid: snapshot.data!.docs[index]),
                        ));
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            child: Text(snapshot.data!.docChanges[index].doc['name']
                              .toString().substring(0,1).toUpperCase(),
                        )),
                        title:
                            Text(snapshot.data!.docChanges[index].doc['name']),
                        subtitle: Text(
                            snapshot.data!.docChanges[index].doc['number']),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
