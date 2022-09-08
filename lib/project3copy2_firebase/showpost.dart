import 'package:all_taskes/class/class_account.dart';
import 'package:all_taskes/class/class_firebase/post_model.dart';
import 'package:all_taskes/database/data1.dart';
import 'package:all_taskes/fire_base/firestore.dart';
import 'package:all_taskes/fire_base/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class showpost_fire extends StatefulWidget {
  Stream postsStream;

  String? bu;

  List? x;

  showpost_fire(Stream this.postsStream);

  @override
  State<StatefulWidget> createState() {
    return ShowPostState();
  }
}

class ShowPostState extends State<showpost_fire> {
  var PhotosRef = FirebaseStorage.instance.ref("Images");
  Uint8List? ImageBytes;

  late List x;
  final userref = FirebaseFirestore.instance.collection("${UserData.username}");
  Database2 db = new Database2();
  final urlimage =
      'https://i.pinimg.com/originals/5c/cd/75/5ccd7544f3908ca293f66e9b186015df.jpg';

  TextEditingController postController = TextEditingController();

  late Map posts;

  getuserid(PostModel post) {
    final String id = "${post.postID}";
    userref.doc(id).get().then((DocumentSnapshot doc) {
      return doc.data();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    print('dasdsadddddddd');
    super.initState();
    getPosts();
  }

  getPosts() {
    db.getPosts().then((snapshots) {
      setState(() {
        widget.postsStream = snapshots;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset('assets/images/face.png'),
                    Text(
                      " ${"hallow ${UserData.username.substring(0, UserData.username.length - 10)}"}",
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
            ),
          )),
      body: Container(
        height: 900,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/yoyo.jpg'),
          fit: BoxFit.cover,
        )),
        child: StreamBuilder(
            stream: widget.postsStream,
            builder: (context, AsyncSnapshot snap) {
              if (snap.connectionState == ConnectionState.active ||
                  snap.connectionState == ConnectionState.done) {
                if (snap.hasError) {
                  return Text('Error!');
                } else if (snap.hasData == false) {
                  return Text('Empty Data');
                } else {
                  return ListView.builder(
                      itemCount: snap.data.docs.length,
                      itemBuilder: (context, int index) {
                        Map postMap = snap.data.docs[index].data();
                        print(postMap);

                        PostModel post = PostModel(
                            postID: snap.data.docs[index].id,
                            postContent: postMap['content'],
                            Username: postMap['username'],
                            liked: postMap['liked'],
                            NumOfLikes: postMap['NumOfLikes'],
                            NumOfdLikes: postMap['NumOfdLikes']);

                        //  print(post.liked);
                        // print(post.Username);
                        //  x=getuserid(post);
                        //print("postMap['username']====>${postMap['username']}");
                        //getImageFromStorage(postMap['username']);
                        posts = postMap;
                        print("posts['username'] ${posts['username']}");
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(1000, 1000, 1000, 200),
                            ),
                            child: Container(
                              child: ListTile(
                                leading: Container(
                                    width: 50,
                                    height: 50,
                                    color: Color.fromRGBO(0, 8, 255, 0.3),
                                    child:
                                        ImageItem(post.Username) //file != null
                                    //? Image.file(
                                    //file,
                                    //fit: BoxFit.fill,

                                    //)
                                    // : SizedBox(),
                                    ),
                                title: Text(
                                    "${post.Username!.substring(0, post.Username!.length - 10)}=>${post.postContent}"),
                                subtitle: Row(children: [
                                  Container(
                                    height: 30,
                                    width: 80,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          post.liked = "1";

                                          post.NumOfLikes =
                                              (post.NumOfLikes! + 1)!;

                                          await db.updateLike(post);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            post.liked == "1"
                                                ? Icon(Icons.thumb_up_alt)
                                                : Icon(Icons
                                                    .thumb_up_alt_outlined),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text("${post.NumOfLikes}"),
                                            ),
                                          ],
                                        )

                                        //post.liked=="1"? Icon(Icons.thumb_up_alt)
                                        //:Icon(Icons.thumb_up_alt_outlined),

                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 30,
                                      width: 80,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            post.liked = "2";
                                            post.NumOfdLikes =
                                                (post.NumOfdLikes! + 1)!;
                                            await db.updatedLike(post);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              post.liked == "2"
                                                  ? Icon(Icons.thumb_down_alt)
                                                  : Icon(Icons
                                                      .thumb_down_alt_outlined),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child:
                                                    Text("${post.NumOfdLikes}"),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ]),
                                trailing: Icon(Icons.food_bank),
                              ),
                            ));
                      });
                }
              } else {
                return Text('Error');
              }
            }),
      ),
    ));
  }
}

class ImageItem extends StatefulWidget {
  String? imageName;
  ImageItem(this.imageName);
  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  var PhotosRef = FirebaseStorage.instance.ref("Images");
  Uint8List? ImageBytes;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageFromStorage();
  }

  getImageFromStorage() async {
    PhotosRef.child(widget.imageName as String)
        .getData(7 * 1024 * 1024)
        .then((value) {
      {
        setState(() {
          ImageBytes = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ImageBytes != null
        ? Image.memory(
            ImageBytes as Uint8List,
            fit: BoxFit.fill,
          )
        : Image.asset(
            'assets/images/face2.png',
            fit: BoxFit.fill,
          );
  }
}
