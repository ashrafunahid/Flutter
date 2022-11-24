import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_video_player/in_alert_dialog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Youtube Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final videoURL1 = "https://www.youtube.com/watch?v=eYsLqsvunKg";
  final videoURL2 = "https://www.youtube.com/watch?v=nPinaJ2YoqM";
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoID1 = YoutubePlayer.convertUrlToId(videoURL1);
    final videoID2 = YoutubePlayer.convertUrlToId(videoURL2);
    _controller1 = YoutubePlayerController(
        initialVideoId: videoID1!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: videoID2!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Youtube Video Player"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => InAlertDialog()));
              },
              icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                YoutubePlayer(
                    controller: _controller1,
                  showVideoProgressIndicator: true,
                  thumbnail: Image.asset('assets/images/kiwami.jpg'),
                  aspectRatio: 16 / 9,
                ),
                YoutubePlayer(
                  controller: _controller2,
                  showVideoProgressIndicator: true,
                  thumbnail: Image.asset('assets/images/kiwami.jpg'),
                  aspectRatio: 16 / 9,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
