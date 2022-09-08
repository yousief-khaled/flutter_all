import 'package:all_taskes/class/class_firebase/post_model.dart';
import 'package:all_taskes/fire_base/firestore.dart';
import 'package:all_taskes/fire_base/userdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePageeq extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePageeq> {
  Database2 db = new Database2();
  late double scwidth, scheight;
  TextEditingController _postController = TextEditingController();
  List<PostModel> posts = [];

  late Stream postsStream;

  getPosts() {
    db.getPosts().then((snapshots) {
      setState(() {
        postsStream = snapshots;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosts();
  }
  @override
  Widget build(BuildContext context) {
    scwidth = MediaQuery.of(context).size.width;
    scheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: scwidth,
            height: scheight,
            child: Column(
              children: [
                SizedBox(
                  height: scheight * 0.01,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 7,
                            spreadRadius: 5,
                            offset: Offset(0, 3))
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(scwidth * 0.01),
                      child: Column(
                        children: [
                          TextField(
                            controller: _postController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: 'Write something..',
                                filled: true,
                                fillColor: Colors.white,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    top: scheight * 0.06,
                                    bottom: scheight * 0.06)),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              //TODO Post
                              if (_postController.text.isNotEmpty) {
                                await db.SavePost(PostModel(
                                    postContent: _postController.text,
                                    Username: UserData.username));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Post published :)")));
                              }
                            },
                            minWidth: scwidth * 9,
                            height: scheight * 0.07,
                            color: Colors.blueAccent,
                            child: Text(
                              'Post',
                              style:
                              TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: scheight * 0.03,
                ),
                StreamBuilder(
                    stream: postsStream,
                    builder: (context, AsyncSnapshot snap) {
                      if (snap.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snap.connectionState ==
                          ConnectionState.active ||
                          snap.connectionState == ConnectionState.done) {
                        if (snap.hasError) {
                          return Text('Error!');
                        } else if (snap.hasData == false) {
                          return Text('Empty Data');
                        } else {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: snap.data.docs.length,
                                itemBuilder: (context, index) {
                                  Map _postMap = snap.data.docs[index].data();
                                  return PostTile(PostModel(
                                      postID: snap.data.docs[index].id,
                                      postContent: _postMap['content'],
                                      Username: _postMap['username'],
                                      liked: _postMap['liked'],
                                      NumOfLikes: _postMap['NumOfLikes']));
                                }),
                          );
                        }
                      }else{
                        return Text('Error');
                      }
                    }),
                SizedBox(
                  height: scheight * 0.15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget PostTile(PostModel currentPost) {
    return Padding(
      padding: EdgeInsets.only(bottom: scheight * 0.03),
      child: Container(
        width: scwidth * 0.1,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 3),
              spreadRadius: 2,
              blurRadius: 7)
        ]),
        child: Column(
          children: [
            Text(
              "dfdsfsd",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: scheight * 0.05,
                  width: scwidth * 0.5,
                  decoration: BoxDecoration(
                    color: currentPost.liked=="1" ? Colors.blueAccent : Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      //TODO like post
                      setState(() {

                      });
                    },
                    child: Center(
                        child: Text(
                          currentPost.liked=="1" ? 'liked' : 'like',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: currentPost.liked=="0"
                                  ? Colors.white
                                  : Colors.blueAccent),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: scwidth * 0.05),
                  child: Text("${currentPost.NumOfLikes} likes"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
