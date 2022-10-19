import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostCarousel extends StatelessWidget {

  final PageController pageController;
  final String title;
  final List<Post> posts;
  PostCarousel({this.pageController, this.title, this.posts});

  _buildPost(BuildContext context, int index){
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget){
        double value = 1;
        if(pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * MediaQuery.of(context).size.height * .40,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: MediaQuery.of(context).size.height * .40,
                width: MediaQuery.of(context).size.width * .70,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Container(
              // margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(12.0),
              height: MediaQuery.of(context).size.height * .13,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(post.title, style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(post.location, style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red,),
                          SizedBox(width: 6.0,),
                          Text(post.likes.toString(), style: TextStyle(fontSize: 18.0),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.comment, color: Theme.of(context).primaryColor,),
                          SizedBox(width: 6.0,),
                          Text(post.comments.toString(), style: TextStyle(fontSize: 18.0),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(title, style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .40,
          child: PageView.builder(
             controller: pageController,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index){
                return _buildPost(context, index);
              }
          ),
        ),
      ],
    );
  }
}
