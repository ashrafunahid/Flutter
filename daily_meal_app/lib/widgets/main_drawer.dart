import 'package:daily_meal_app/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTite(String title, IconData icon, Function tapHandler){
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title, style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24, fontWeight: FontWeight.bold),),
      onTap: tapHandler
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).primaryColor),),
          ),
          SizedBox(height: 20,),
          buildListTite('Meals', Icons.restaurant, (){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTite('Filter', Icons.filter_alt_outlined, (){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}),
        ],
      ),
    );
  }
}
