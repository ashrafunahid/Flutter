import 'package:flutter/material.dart';
import 'package:navigation_drawer/people_page.dart';
import 'favourite_page.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final name = "Ashraf Uddin";
    final email = "ashrafunahid@gmail.com";
    final urlImage = "https://scontent.fdac116-1.fna.fbcdn.net/v/t31.18172-8/12339539_1051452574886560_5922055887321468039_o.jpg?_nc_cat=102&ccb=1-5&_nc_sid=174925&_nc_eui2=AeFYB5Uz9TtPHMZZQEIVTLKEPFwbOwxN6h08XBs7DE3qHfK_1Zo33v2iwE7tbOwlgVhBvAFd4TLfsz4marRaXOHo&_nc_ohc=KTUrlrn-ClsAX-gDkGr&_nc_ht=scontent.fdac116-1.fna&oh=00_AT86SmPBMk-l95hsTRjwnnh0x2ihL0BlefeONrwXWlQ6mA&oe=61F5A4B6";
    return Drawer(
      child: Material(
        color: Colors.blueAccent,
        child: ListView(
          // padding: EdgeInsets.all(20),
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            const SizedBox(height: 48),
            buildMenuItem(
              text: 'People',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Favourites',
              icon: Icons.favorite_border,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Workflow',
              icon: Icons.workspaces_outline,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Updates',
              icon: Icons.update,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white70),
            const SizedBox(height: 24),
            buildMenuItem(
              text: 'Plugins',
              icon: Icons.account_tree_outlined,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notifications_outlined,
              onClicked: () => selectedItem(context, 5),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader({
  required String urlImage,
  required String name,
  required String email,
  // required VoidCallback onClicked,
}) =>
    InkWell(
      // onTap: onClicked,
      child: Container(
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              child: Icon(Icons.add_comment_outlined, color: Colors.white),
            )
          ],
        ),
      ),
    );

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PeoplePage()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FavouritePage()));
      break;
  }
}
