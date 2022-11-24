import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InAlertDialog extends StatefulWidget {

  @override
  State<InAlertDialog> createState() => _InAlertDialogState();
}

class _InAlertDialogState extends State<InAlertDialog> {

  final videoURL = "https://www.youtube.com/watch?v=eYsLqsvunKg";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoID1 = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID1!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                );
              }
          );
        },
        child: Icon(Icons.smart_display, color: Colors.red, size: 40,),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
