import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';


class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
  
}

class _VideoState extends State<Video> {
    
  @override
    void initState() {
      super.initState();
    
    }


  
@override
  void deactivate() {
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Punjabi Ekta party",style: TextStyle(color: Colors.blue),),centerTitle: true,backgroundColor: Colors.white70,
      ),
          body:Column(
            children: <Widget>[
              YoutubePlayer(
              source: "https://www.youtube.com/watch?v=6eo6sYbpqHE",
              quality: YoutubeQuality.HD,
              aspectRatio: 16/9,
              showThumbnail: true,
             ),
             Text("Punjabi Ekta Party"),
            ],
          ),
    );

  }
}