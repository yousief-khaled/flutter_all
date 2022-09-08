import 'dart:developer';
import 'dart:typed_data';

import 'package:all_taskes/fire_base/userdata.dart';
import 'package:all_taskes/first_page.dart';
import 'package:all_taskes/project3copy2_firebase/test/setting.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class shapmassage extends StatefulWidget {
  final String massage;
  final String username;
  final bool chek;
  final int? x;
  final String name;
//final Key key;
//{required this.key}
  shapmassage(this.massage, this.username, this.chek, this.x, this.name);
  @override
  State<StatefulWidget> createState() {
    return pagee();
  }
}

class pagee extends State<shapmassage> {
  var PhotosRef = FirebaseStorage.instance.ref("Images");
  Uint8List? ImageBytes;
  Uint8List? ImageBytes2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getPosts();

    print(widget.x);
    getImageFromStorage();
    getImageFromStorageother();
  }

  getImageFromStorage() async {
    //print("kk");
    PhotosRef.child(UserData.username as String)
        .getData(7 * 1024 * 1024)
        .then((value) {
      {
        if (value != null) {
          setState(() {
            // print("  value ===========> ${value}");
            ImageBytes = value;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(" you didnot have image  :)")));
        }
      }
    });
  }

  getImageFromStorageother() async {
    // print("kk");
    PhotosRef.child(widget.username as String)
        .getData(7 * 1024 * 1024)
        .then((value) {
      {
        if (value != null) {
          setState(() {
            //print("  value ===========> ${value}");
            ImageBytes2 = value;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(" you didnot have image  :)")));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment:
          widget.chek == true ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(4.0),
              width: widget.x! < 30 ? (widget.x! * 10) + 100 : 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: widget.chek == true
                        ? Radius.circular(20)
                        : Radius.circular(0),
                    bottomLeft: widget.chek == false
                        ? Radius.circular(20)
                        : Radius.circular(0)),
                color: widget.chek == true
                    ? Color.fromRGBO(51, 71, 86 ,1)
                    : Color.fromRGBO(44, 57, 75 ,1),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: widget.chek == true
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      widget.chek == true
                          ? Flexible(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(widget.name,
                                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic))),
                              ],
                            ))
                          : Flexible(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                  Container(
                                      child: Text(widget.name,
                                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic))),
                                  Container(
                                    child: ImageBytes2 != null
                                        ? Image.memory(
                                            ImageBytes2 as Uint8List,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            'assets/images/face2.png',
                                            fit: BoxFit.cover,
                                          ),
                                  //  backgroundColor: Colors.blueGrey,
                                    height: 20,
                                  ),
                                ])),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: widget.chek == true
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Flexible(
                          child: Container(
                              child: Text(
                        widget.massage,
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white),
                      )))
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }
}
