import 'package:daily_meal_app/screens/categories_screen.dart';
import 'package:daily_meal_app/screens/favourite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.category), text: 'Categories',),
                Tab(icon: Icon(Icons.star), text: 'Favourite',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavouriteScreen(),
            ],
          ),
        ));
  }
}
