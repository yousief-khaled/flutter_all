import 'dart:typed_data';

import 'package:all_taskes/fire_base/firestore.dart';
import 'package:all_taskes/fire_base/userdata.dart';
import 'package:all_taskes/project3copy2_firebase/test/test.dart';
import 'package:all_taskes/taskes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart' show rootBundle;
class setting extends StatefulWidget{
  var file2;
  setting(this.file2);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }


}
class vvv{
 static List<String>? arrypath=["f"];
}

class page extends State<setting>{

  var file;


  Database2 db =Database2();
  var m;
  List<Map<String,dynamic>>? lestt=[];


  var PhotosRef=FirebaseStorage.instance.ref("Images");
  Uint8List? ImageBytes;
  final _picker = ImagePicker();
  PickedFile? image;
  var copy;
   initState()  {
    // TODO: implement initState
    super.initState();
    // getPosts();

    cheakimageforuser();



     //getImageFromFirebase();


  }
  cheakimageforuser()
  async {
    var name = await FirebaseFirestore.instance.collection('pathimage').doc(UserData.username).get();
    if(name['username']!=null && name['username']==UserData.username )
      {
        widget.file2=name['path'];


      }
    else
      {
       widget.file2=null;
      }
  }
  getImageFromFirebase()async{
    print("kk");
    PhotosRef.child('yoyo').getData(7*1024*1024).then((value) {{
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


  getimagefrom_mob() async {
    await Permission.photos.request();

    var status = await Permission.photos.status;

    if (status.isGranted) {
      image = await _picker.getImage(source: ImageSource.gallery);

      file = File(image!.path);

      setState(() {
        if (file != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(" Get succsesfully :)")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(" Try get onther image :)")));
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("fe moshkla ya brens")));
    }


    print(file);
    print(file.toString());
  }

  uploudimagetofirebase() async {
    final _firebaseStorage = FirebaseStorage.instance;
    if (image != null) {
      await _firebaseStorage
          .ref("Images/yoyo")
          .putFile(file)
          .whenComplete(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Uploaded successfully :)")));
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage50(widget.file2)));
          },
          icon: Icon(Icons.arrow_back_outlined),


        ),
      ),
      body:Container(
        decoration: BoxDecoration(
            image: widget.file2!=null? DecorationImage(
              image:  FileImage(
                File(widget.file2),

              //  fit: BoxFit.fill,
              ),

              fit: BoxFit.cover,
            ):null,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () async {
                    await getimagefrom_mob();
                   await db.Savepathimage(file);
                   await cheakimageforuser();
                   vvv.arrypath!.add(UserData.username);
                   setState(() {

                   });

                      await uploudimagetofirebase();
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage50(widget.file2)));


                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color.fromRGBO(0, 8, 255 , 0.3),
                  child: Text(
                    'Change backGround',
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

            ],
          ),
        ),
      ) ,
    );
  }


}