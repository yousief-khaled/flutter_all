import 'package:all_taskes/class/data.dart';
import 'package:all_taskes/fire_base/firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'show_contaner2.dart';

class show_practice extends StatefulWidget {
  int pract;
  int level;
  show_practice(this.pract, this.level);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<show_practice> {
  Database2 db = Database2();
  ScrollController controller = ScrollController();
  Stream? postsStream;
  late double topcountainer;

  bool closetopcontroller = false;
  //VideoPlayerController? playerController;

  //Future<void>? _initializeVideoPlayerFuture;
  getPosts() {
    db.getalldata().then((snapshots) {
      setState(() {
        postsStream = snapshots;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topcountainer = 0;
    getPosts();

    controller.addListener(() {
      double valuee = controller.offset / 119;
      // print(valuee);
      setState(() {
        topcountainer = valuee;
        closetopcontroller = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text("Exercise"),
        //centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            StreamBuilder(
                stream: postsStream,
                builder: (context, AsyncSnapshot snap) {
                  if (!snap.hasData) {
                    return CircularProgressIndicator();
                  } else if (snap.connectionState == ConnectionState.active ||
                      snap.connectionState == ConnectionState.done) {
                    if (snap.hasError) {
                      return Text('Error!');
                    } else if (snap.hasData == false) {
                      return Text('Empty Data');
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            controller: controller,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount:snap.data.docs.length,
                            itemBuilder: (context, int index) {
                              double scale = 1.0;
                              if (topcountainer > 0.5) {
                                scale = index + 0.5 - topcountainer;
                                if (scale < 0) {
                                  scale = 0;
                                } else if (scale > 1) {
                                  scale = 1;
                                }
                              }
                              Map postMap = snap.data.docs[index].data();

                              print(scale);

                              print("${showw_practic.length}");

                            print("postMap['id']=${postMap['id']}");
                            print("postMap['level']=${postMap['level']}");
                              if (postMap['id'] == widget.pract &&
                                  postMap['level'] == widget.level) {
                                return Opacity(
                                  opacity: scale,
                                  child: Transform(
                                    alignment: Alignment.bottomCenter,
                                    transform: Matrix4.identity()
                                      ..scale(scale, scale),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: cont(postMap),
                                    ),
                                  ),
                                );
                              } else {
                                return Opacity(
                                  opacity: scale,
                                  child: Transform(
                                    alignment: Alignment.bottomCenter,
                                    transform: Matrix4.identity()
                                      ..scale(scale, scale),
                                    child: SizedBox(
                                      height: 0.01,
                                    ),
                                  ),
                                );
                              }
                            }),
                      );
                    }
                  } else {
                    return Text('Error');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
