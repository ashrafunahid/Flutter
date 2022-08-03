import 'package:flutter/material.dart';

import 'categories_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Daily Meal App',
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      accentColor: Colors.purple,
      canvasColor: Colors.white,
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
        // bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        // bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        titleMedium: TextStyle(fontSize: 20.0, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
      ),
    ),
    home: CategoriesScreen(),
  ));
}
