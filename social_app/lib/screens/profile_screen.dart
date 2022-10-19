import 'package:flutter/material.dart';
import 'package:social_app/widgets/custom_drawer.dart';
import 'package:social_app/widgets/post_carousel.dart';

import '../models/user_model.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPageController;
  PageController _favoritePostsPageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yourPostsPageController = PageController(initialPage: 1, viewportFraction: 0.7);
    _favoritePostsPageController = PageController(initialPage: 1, viewportFraction: 0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height * .40,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 60.0,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 120.0,
                          width: 120.0,
                          image: AssetImage(widget.user.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(widget.user.name, style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    Text('Following', style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black54,
                    ),),
                    SizedBox(height: 2.0,),
                    Text(widget.user.following.toString(), style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Followers', style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black54,
                    ),),
                    SizedBox(height: 2.0,),
                    Text(widget.user.followers.toString(), style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                ),
              ],
            ),
            PostCarousel(pageController: _yourPostsPageController, title: 'Your Posts', posts: widget.user.posts,),
            PostCarousel(pageController: _favoritePostsPageController, title: 'Favorites', posts: widget.user.favorites,),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}
