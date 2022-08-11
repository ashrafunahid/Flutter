import 'package:daily_meal_app/screens/category_meals_screen.dart';
import 'package:daily_meal_app/screens/meal_detail_screen.dart';
import 'package:daily_meal_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';

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
    // home: CategoriesScreen(),
    initialRoute: '/',
    routes: {
      '/': (context) => TabsScreen(),
      CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
      MealDetailScreen.routeName: (context) => MealDetailScreen(),
    },
    onGenerateRoute: (setting){
      print(setting.arguments);
      return MaterialPageRoute(builder: (context) => CategoriesScreen());
    },
    onUnknownRoute: (settings){
      return MaterialPageRoute(builder: (context) => CategoriesScreen());
    },
  ));
}
