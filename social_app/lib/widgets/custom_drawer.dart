import 'package:flutter/material.dart';
import 'package:social_app/data/data.dart';
import 'package:social_app/screens/home_screen.dart';
import 'package:social_app/screens/login_screen.dart';
import 'package:social_app/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {

  _buildDrawerOption(Icon icon, String title, Function onTap){
    return ListTile(
      leading: icon,
      title: Text(title,
        style: TextStyle(fontSize: 20.0),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: MediaQuery.of(context).size.height * .30,
                width: double.infinity,
                image: AssetImage(
                  currentUser.backgroundImageUrl
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                  left: 20.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).primaryColor
                        )
                      ),
                    ),
                    SizedBox(width: 6.0,),
                    Text(currentUser.name,style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2
                    ),)
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard),
            'Home',
              (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
              }
          ),
          _buildDrawerOption(Icon(Icons.chat), 'Chat', (){}),
          _buildDrawerOption(Icon(Icons.location_on), 'Location', (){}),
          _buildDrawerOption(
              Icon(Icons.account_circle),
              'Profile',
                  (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen(user: currentUser)));
                  }
                  ),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', (){}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                  Icon(Icons.directions_run),
                  'Logout',
                      (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
