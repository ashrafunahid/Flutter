import 'package:flutter/material.dart';
import 'package:sqlite_database_crud/edit_todo.dart';
import 'package:sqlite_database_crud/todo_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter SQFLite CRUD",
      home: MyHome(),
    );
  }
}


