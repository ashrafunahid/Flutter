import 'package:flutter/material.dart';
import './pages/page_one.dart';
import './pages/page_two.dart';
import './helpers/custom_route.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Flutter Page Transition',
  theme: ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
          TargetPlatform.iOS: CustomPageTransitionBuilder(),
        }
    ),
  ),
  home: Scaffold(
    appBar: AppBar(
      title: Text('Flutter Page Transition'),
      centerTitle: true,
    ),
    body: MainBody(),
  ),
));

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageOne()));
              },
              child: Text("Page One")
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageTwo()));
              },
              child: Text("Page Two")
          ),
        ],
      ),
    );
  }
}
