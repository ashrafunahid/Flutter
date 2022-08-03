import 'package:daily_meal_app/category_item.dart';
import 'package:flutter/material.dart';

import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Meal App"),
        centerTitle: true,
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id, e.title, e.color)).toList(),
      ),
    );
  }
}
