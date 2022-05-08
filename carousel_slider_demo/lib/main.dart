import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
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


  List<String> _ImageList = [
    'https://www.motorsheba.com/public/uploads/all/2KbbeFxhBGovjfAn2alWvhvtZB5GBIYU6NHLPFnG.jpg',
    'https://www.motorsheba.com/public/uploads/all/9Ns8gzn8ChnUgOIhAIWNye9xk5ET93YlIH9VJyox.jpg',
    'https://www.motorsheba.com/public/uploads/all/bTvY9vmEO79TgloA3ClrsmAs5ZgGX2LcAWbWz9q3.jpg',
    'https://www.motorsheba.com/public/uploads/all/tb2BxzCqjmsacYVYpdZia8nYKo0zHX3EMJMAIuuW.jpg',
    'https://www.motorsheba.com/public/uploads/all/LxHDKY8szyCM8LGKHjw4S38mUTjIEUqv9hzvtylc.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
          itemCount: _ImageList.length,
          itemBuilder: (context, index, pageIndex){
            return Card(
              elevation: 15,
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: _MyColorList[index],
                ),
                // child: Text(index.toString(), style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),),
                child: Image(image: NetworkImage(_ImageList[index]), fit: BoxFit.cover,),
              ),
            );
          },
          options: CarouselOptions(
            height: 250,
            aspectRatio: 16/9,
            initialPage: 10,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
          ),
      ),
    );
  }
}


