import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class vedio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }


}
class page extends State<vedio>{
  VideoPlayerController? playerController;
Future<void>? _initializeVideoPlayerFuture;


  //VoidCallback? listener;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerController=VideoPlayerController.asset("assets/videos/vv.mp4");
    _initializeVideoPlayerFuture= playerController!.initialize();
    playerController!.setLooping(true);
    playerController!.setVolume(1.0);
    playerController!.play();

  }
@override
  void dispose() {
    // TODO: implement dispose
  playerController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context,snapshot)
        {
          if(snapshot.connectionState==ConnectionState.done)
            {
                 return AspectRatio(
                   aspectRatio: playerController!.value.aspectRatio,
                   child: VideoPlayer(playerController!) ,


                 );
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(playerController!.value.isPlaying?Icons.pause:Icons.play_arrow),
        onPressed: (){
          setState(() {
            if(playerController!.value.isPlaying){
              playerController!.pause();

            }
            else
              {
                playerController!.play();

              }
          });
        },
      ),

    );
  }



}