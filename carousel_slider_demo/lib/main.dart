import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: MyBody(),
    ),
  ));
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {

  List<Color> _MyColorList = [
    Colors.red,
    Colors.redAccent,
    Colors.green,
    Colors.cyanAccent,
    Colors.lightGreen,
    Colors.cyan,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.lightBlueAccent,
  ];

  int _currentCarousel = 0;
  final CarouselController _controller = CarouselController();

  List<String> _ImageList = [
    'https://www.motorsheba.com/public/uploads/all/0XVy9KfTTOKNsOca2juJIItue8vQJ4CzKXxcqPTG.jpg',
    'https://www.motorsheba.com/public/uploads/all/3HyiJU0UDx0G2muZrgWws1al4LhnWk82W9K1aIQj.jpg',
    'https://www.motorsheba.com/public/uploads/all/wWvhE7GYDD9yCxySy5DJxzOYbiktg9ATQ2VsgUNP.jpg',
    'https://www.motorsheba.com/public/uploads/all/WWfkIhuOJlTb3L7KpKYbdR6P7tmAR1SJOJaczLxM.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            child: CarouselSlider.builder(
              carouselController: _controller,
              itemCount: _ImageList.length,
              itemBuilder: (context, index, pageIndex) {
                return Card(
                  color: _MyColorList[index],
                  elevation: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    // alignment: Alignment.center,
                    child: Image(
                      image: NetworkImage(_ImageList[index]),
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height*.21,
                  aspectRatio: 16/9,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  pauseAutoPlayOnTouch: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index, reason){
                    setState(() {
                      _currentCarousel = index;
                    });
                  }
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _ImageList.asMap().entries.map((entry){
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: _currentCarousel == entry.key ? 30:10,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(image: AssetImage(_currentCarousel == entry.key ? "assets/icon/red_bar.png":"",)),
                    // shape: _currentCarousel == entry.key ? BoxShape.circle:BoxShape.rectangle,
                    color: Colors.red.withOpacity(_currentCarousel == entry.key ? 0.9:0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}


