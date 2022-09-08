import 'dart:io';
import 'dart:typed_data';

import 'package:all_taskes/class/class_firebase/post_model.dart';
import 'package:all_taskes/class/popmenu/choise.dart';
import 'package:all_taskes/fire_base/firestore.dart';
import 'package:all_taskes/fire_base/userdata.dart';
import 'package:all_taskes/project3copy2_firebase/test/page_gym.dart';
import 'package:all_taskes/project3copy2_firebase/test/setting.dart';
import 'package:all_taskes/project3copy2_firebase/test/shap_of%20massage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:all_taskes/uploud%20and%20get%20image/surevices/notefecation.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class HomePage50 extends StatefulWidget {
   var file40;

  HomePage50([ this.file40]);



  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage50> {
  CollectionReference pathimage =
      FirebaseFirestore.instance.collection("pathimage");

  var file3;

  var PhotosRef = FirebaseStorage.instance.ref("Images");
  Uint8List? ImageBytes;
  var choisee = <chois>[
    chois(titel: "Setting", icon: Icons.settings),
  ];

  String? x;
  Database2 db = new Database2();
  late double scwidth, scheight;
  TextEditingController _postController = TextEditingController();
  List<PostModel> posts = [];

  Stream? postsStream;

  getPosts() {
    db.getmassages().then((snapshots) {
      setState(() {
        postsStream = snapshots;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    // cheakimageforuser();
    cheakimageforuser();

    getPosts();
    getImageFromStorage();
    print( "${vvv.arrypath!.length}mosalaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah* ");

  }

  getImageFromStorage() async {
    print("kk");
    PhotosRef.child(UserData.username as String)
        .getData(7 * 1024 * 1024)
        .then((value) {
      {
        if (value != null) {
          setState(() {
            print("  value ===========> ${value}");
            ImageBytes = value;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(" you didnot have image  :)")));
        }
      }
    });
  }

  //var snapshot = await FirebaseFirestore.instance.collection('pathimage')
  //  .where("username", isEqualTo:UserData.username ).get();
  //print("${snapshot['username']} ************************************************************");
  cheakimageforuser() async {
    bool d = false;

    for (int i = 0; i < vvv.arrypath!.length; i++) {
      if (UserData.username == vvv.arrypath![i]) {
        d = true;
        break;
      } else {
        d = false;
      }
    }
    if (d == true) {
      var name = await FirebaseFirestore.instance
          .collection('pathimage')
          .doc(UserData.username)
          .get();
      print(
          "${name['username']} dsaaaaaaaaaaaaaaaaadsaaaaaaaaaaaaa4654465456 ");

      if (name['username'] != null && name['username'] == UserData.username) {
        file3 = name['path'];
        widget.file40=file3;
        print("fileeeeeeeeeeeeeeeeeee**********/*/*//*/*/*/*/********** $file3");
      } else {
        file3 = null;
        widget.file40=file3;
      }
    } else {
      file3 = null;
      widget.file40=file3;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("######################################MMMMMMMMMMMMM");

    scwidth = MediaQuery.of(context).size.width;
    scheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 71, 86 ,1),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page_gym(widget.file40)));
          },
          icon: Icon(Icons.arrow_back_outlined),


        ),
        title: Row(children: [
          Container(
            child: ImageBytes != null
                ? Image.memory(
                    ImageBytes as Uint8List,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/face2.png',
                    fit: BoxFit.cover,
                  ),
            //backgroundColor: Colors.blueGrey,
            //radius: 30,
            height: 50,
          ),
          SizedBox(
            width: 10,
          ),
          Text(UserData.name)
        ]),
        actions: [
          // IconButton(onPressed: (){}, icon:Icon( choisee[0].icon)),
          PopupMenuButton(
            itemBuilder: (context) {
              return choisee.map((choisee) {
                return PopupMenuItem(
                  value: choisee,
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.blue,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text("${choisee.titel}"),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (chois c) async {
              print(c.titel);
              await cheakimageforuser();
              setState(() {

              });
              if (c.titel == 'Setting') {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => setting(file3)));

              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(

             image: widget.file40!=null? DecorationImage(
             image:  FileImage(
             File(widget.file40),


             ),

            fit: BoxFit.cover,
             ):null,
          color: widget.file40==null?Color.fromRGBO(8, 32, 50 ,1):null),
        child: Center(
          child: SizedBox(
            width: scwidth,
            height: scheight,
            child: Column(
              children: [
                SizedBox(
                  height: scheight * 0.01,
                ),
                SizedBox(
                  height: scheight * 0.03,
                ),
                StreamBuilder(
                    stream: postsStream,
                    builder: (context, AsyncSnapshot snap) {
                      if (!snap.hasData) {
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
                                reverse: true,
                                itemCount: snap.data.docs.length,
                                itemBuilder: (context, index) {
                                  // Map _postMapp = snap.data.docs[index].data();
                                  Map _postMap = snap.data.docs[index].data();
                                  bool chk = (_postMap['username'] ==
                                      UserData.username);
                                  int? x = _postMap['text'].toString().length;
                                  print(_postMap['name']);
                                  return shapmassage(
                                      _postMap['text'],
                                      _postMap['username'],
                                      chk,
                                      x,
                                      _postMap['name']);
                                }),
                          );
                        }
                      } else {
                        return Text('Error');
                      }
                    }),
                Container(
                    decoration: BoxDecoration(
                      //color: Colors.blueGrey,
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
                      child: Row(
                        children: [
                          Container(
                            width: 320,
                            child: TextField(

                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(51, 71, 86 ,1),
                                  filled: true,

                                  hintText: "Enter Your massage",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Color.fromRGBO(8, 32, 50 ,1)),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color:Color.fromRGBO(8, 32, 50 ,1)),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.add_to_home_screen,
                                    color: Colors.black,
                                  ),
                                  //helperText:'Enter Your massage' ,

                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              controller: _postController,
                              onChanged: (email) {
                                print(email);
                              },
                              cursorColor: Colors.green[800],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Container(
                              height: 50,

                              child: FloatingActionButton(

                                onPressed: () async {
                                  print(_postController.text);
                                  x = _postController.text;
                                  if (x!.isNotEmpty) {
                                    await db.Savemassage(_postController.text);

                                    _postController.clear();
                                  } else {
                                    await db.filldata();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("your Text is empty")));
                                    _postController.clear();
                                  }
                                },
                                child: Icon(Icons.send),
                                backgroundColor: Color.fromRGBO(255, 76, 41 ,1),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Widget PostTile() {
// return shapmassage(post['text'],post['username'],chk,{required this.key});
// }
