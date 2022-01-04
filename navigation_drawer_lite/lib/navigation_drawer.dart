import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'people.dart';
import 'favourite.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.lightBlue,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background2.jpg"),
                    fit: BoxFit.fill),
              ),
              accountName: Text(
                "Ashraf Uddin",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("ashrafunahid@gmail.com",
                  style: TextStyle(fontSize: 18)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/baby.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.white),
              title: Text("People", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PeopleView()));
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border, color: Colors.white),
              title: Text("Favorite", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavouritePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.workspaces_outline, color: Colors.white),
              title: Text("Workflow", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.update, color: Colors.white),
              title: Text("Update", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 15),
            Divider(color: Colors.black54),
            SizedBox(height: 15),
            ListTile(
              leading: Icon(Icons.notifications_outlined, color: Colors.white),
              title:
                  Text("Notification", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.account_tree_outlined, color: Colors.white),
              title: Text("Plugins", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
