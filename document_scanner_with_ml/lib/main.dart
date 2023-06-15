import 'package:document_scanner_with_ml/screens/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Document Scanner",
      home: HomePage(),
    ),
  );
}