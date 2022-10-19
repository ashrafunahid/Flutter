import 'package:flutter/material.dart';
import 'package:social_app/data/data.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/widgets/following_users.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 1, viewportFraction: 0.7);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text('FRENZY', style: TextStyle(
        color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 10.0
      ),),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 18.0
          ),
          tabs: [
            Tab(text: 'Trending',),
            Tab(text: 'Latest',),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FollowingUsers(),
          PostCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
