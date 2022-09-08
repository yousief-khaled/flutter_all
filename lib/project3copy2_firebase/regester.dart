import 'package:all_taskes/class/class_firebase/account_fire.dart';
import 'package:all_taskes/database/data1.dart';
import 'package:all_taskes/fire_base/Auth.dart';
import 'package:all_taskes/fire_base/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'test/login.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Regester_fire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Regester_fire> {
  bool view = false;
  var icon = Icons.visibility;
  Database2 _db = new Database2();
  Auth _auth = new Auth();
  final urlimage =
      'https://i.pinimg.com/originals/5c/cd/75/5ccd7544f3908ca293f66e9b186015df.jpg';
  bool _isSelected = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();
  final _picker = ImagePicker();
  PickedFile? image;
  var file;

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
  }

  uploudimagetofirebase() async {
    final _firebaseStorage = FirebaseStorage.instance;
    if (image != null) {
      await _firebaseStorage
          .ref("Images/${nameController.text}")
          .putFile(file)
          .whenComplete(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Uploaded successfully :)")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 900,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/backarm/im4.jpg'),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 200, left: 10, right: 10, bottom: 180),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(1000, 1000, 1000, 200),
          ),
          height: 450,
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Regestar page ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(0, 54, 249, 100)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.account_circle_rounded,
                        color: Color.fromRGBO(0, 8, 255, 100),
                      ),
                      labelText: 'Your Name',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 8, 255, 100),
                        fontWeight: FontWeight.bold,
                      )),
                  keyboardType: TextInputType.emailAddress,
                  controller: name,
                  onChanged: (email) {
                    print(email);
                  },
                  cursorColor: Colors.green[800],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(0, 54, 249, 100)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromRGBO(0, 8, 255, 100),
                      ),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 8, 255, 100),
                        fontWeight: FontWeight.bold,
                      )),
                  keyboardType: TextInputType.emailAddress,
                  controller: nameController,
                  onChanged: (email) {
                    print(email);
                  },
                  cursorColor: Colors.green[800],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: view,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(0, 54, 249, 100)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(0, 54, 249, 100),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: FloatingActionButton(
                              backgroundColor: Colors.blueAccent,
                              onPressed: () {
                                setState(() {
                                  if (icon == Icons.visibility_off) {
                                    view = false;
                                    icon = Icons.visibility;
                                  } else {
                                    view = true;
                                    icon = Icons.visibility_off;
                                  }
                                });
                              },
                              child: Icon(icon, color: Colors.deepPurple)),
                        ),
                      ),
                      labelText: 'PassWord',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 54, 249, 100),
                        fontWeight: FontWeight.bold,
                      )),
                  keyboardType: TextInputType.emailAddress,
                  controller: passwordController,
                  onChanged: (email) {
                    print(email);
                  },
                  cursorColor: Colors.green[800],
                ),
              ),

              ///////image
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      width: 100,
                      height: 100,
                      color: Color.fromRGBO(0, 8, 255, 0.3),
                      child: file != null
                          ? Image.file(
                              file,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              'assets/images/face2.png',
                              fit: BoxFit.fill,
                            ))
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () async {
                    await getimagefrom_mob();
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color.fromRGBO(0, 8, 255, 0.3),
                  child: Text(
                    'Get Image',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 20.0,
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
                  onPressed: () async {
                    await _auth.SignUp(
                            nameController.text, passwordController.text)
                        .then((value) async {
                      if (value == true) {
                        await uploudimagetofirebase();
                        _db.SaveAccount(AccountModel(
                            username: nameController.text,
                            password: passwordController.text,
                            name: name.text));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Success")));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginPage_fire()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("failed")));
                      }
                    });
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color.fromRGBO(0, 8, 255, 0.3),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
