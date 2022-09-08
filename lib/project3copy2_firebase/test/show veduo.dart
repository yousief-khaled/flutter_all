import 'package:all_taskes/class/data.dart';
import 'package:all_taskes/project3copy2_firebase/test/show_practice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class show_veduo extends StatefulWidget {
  Map index;

  show_veduo(this.index);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<show_veduo> {
  late final VideoPlayerController playerController;

  late ChewieController chewieController;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    playerController =
        VideoPlayerController.asset(widget.index['vedio']);

    //playerController.initialize();

    chewieController = ChewieController(
        videoPlayerController: playerController,
        autoInitialize: true,
        autoPlay: true,
        looping: true,
        errorBuilder: (context, erormassage) {
          return Center(
            child: Text(
              erormassage,
              style: TextStyle(fontSize: 20),
            ),
          );
        });

    final playerWidget = Chewie(
      controller: chewieController,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/backvedue.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: CircleAvatar(
                child: Image.asset(widget.index['icone']),
                radius: 80,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(1000, 1000, 1000, 200),
              ),
              height: 450,
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.index['name']}",
                            textAlign: TextAlign.center,

                            // textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,


                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(

                      thickness: 2,
                      color: Colors.black,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 250,
                            width: 250,

                              child: Chewie(
                                controller: chewieController,
                              ),

                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Flexible(
                          child: Text(
                        widget.index['text'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )

        // AspectRatio(
        // aspectRatio:  playerController!.value.aspectRatio,

        // child: VideoPlayer( playerController!) ,

        //),

        );
  }

  @override
  void dispose() {
    playerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
