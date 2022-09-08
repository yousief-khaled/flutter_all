import 'package:all_taskes/class/class_account.dart';
import 'package:all_taskes/class/class_firebase/post_model.dart';
import 'package:all_taskes/database/data1.dart';
import 'package:all_taskes/fire_base/firestore.dart';
import 'package:all_taskes/fire_base/userdata.dart';
import 'package:all_taskes/project/show_posts.dart';
import 'package:all_taskes/project3copy2_firebase/showpost.dart';
import 'package:all_taskes/uploud%20and%20get%20image/surevices/notefecation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class addpostt extends StatefulWidget{
  //Account currentAccount;
  //cc({required this.currentAccount});
  @override
  _ccState createState() => _ccState();
}

class _ccState extends State<addpostt> {
  NotificationService notificationService = NotificationService();
  var PhotosRef=FirebaseStorage.instance.ref("Images");
  Uint8List? ImageBytes;

  Database2 db = new Database2();
  late Stream postsStream;
  final urlimage='https://i.pinimg.com/originals/5c/cd/75/5ccd7544f3908ca293f66e9b186015df.jpg';

  TextEditingController postController = TextEditingController();
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
    setState(() {
      notificationService.Initialize();

    });
        getPosts();
    getImageFromStorage();
  }
  getImageFromStorage()async{
    print("kk");
    PhotosRef.child(UserData.username as String).getData(7*1024*1024).then((value) {{
      if(value!=null) {
        setState(() {
          print("  value ===========> ${value}");
          ImageBytes = value;
        });
      }
      else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(" you didnot have image  :)")));
      }
    }
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          height: 900,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/yoyo.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 200,left: 10,right: 10,bottom: 100),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(1000,1000,1000, 200),
              ),
              height: 450,

              child: ListView(
                  children: <Widget>[

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[ Container(


                          width:  100,
                          height: 100,
                          color: Color.fromRGBO(0, 8, 255 , 0.3),
                          child: ImageBytes!=null?Image.memory(ImageBytes as Uint8List,fit: BoxFit.fill,):Image.asset('assets/images/face2.png',fit:BoxFit.fill ,) //file != null
                              //? Image.file(
                            //file,
                            //fit: BoxFit.fill,

                          //)
                             // : SizedBox(),
                        ),

                        ]),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          ' Pages FC ',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 3, color: Color.fromRGBO(0, 54, 249 , 100)),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 2, color: Colors.lightBlue),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            prefixIcon: Icon(
                              Icons.add_to_home_screen,
                              color: Color.fromRGBO(0, 8, 255  , 100),
                            ),
                            labelText: 'Enter Your post',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(0, 8, 255  , 100),
                              fontWeight: FontWeight.bold,
                            )),

                        controller: postController,
                        onChanged: (email) {
                          print(email);
                        },
                        cursorColor: Colors.green[800],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () async {

                          if (postController.text.isNotEmpty) {
                             await db.SavePost(PostModel(
                                postContent: postController.text,
                                Username: UserData.username));
                            setState(() {
                              notificationService.InstanceNotification();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Post published :)")));

                            });



                          }
                          else
                            {
                              print("not addd");
                            }

                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Color.fromRGBO(0, 8, 255 , 0.3),
                        child: Text(
                          'ADD POST',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () {

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return showpost_fire(postsStream);
                                }));

                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Color.fromRGBO(0, 8, 255 , 0.3),
                        child: Text(
                          'SHOW POST',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),


                  ]),
            ),
          ),
        ),
      ),
    );
  }

}