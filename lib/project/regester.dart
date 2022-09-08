import 'package:all_taskes/database/data1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'logian.dart';



class Regester extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Regester> {
  bool view=false;
  var icon=Icons.visibility;
  DatabaseHelp db =new DatabaseHelp();
  @override

  final urlimage='https://i.pinimg.com/originals/5c/cd/75/5ccd7544f3908ca293f66e9b186015df.jpg';
  bool _isSelected=false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(



        body: Container(
          height: 900,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/yoyo.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 200,left: 10,right: 10,bottom: 180),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(1000,1000,1000, 200),
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
                    child:TextField(

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
                            Icons.account_circle_rounded,
                            color: Color.fromRGBO(0, 8, 255  , 100),
                          ),
                          labelText: 'Your Name',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 8, 255  , 100),
                            fontWeight: FontWeight.bold,
                          )),
                      keyboardType: TextInputType.emailAddress,
                      controller:name,
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
                            Icons.email,
                            color: Color.fromRGBO(0, 8, 255  , 100),
                          ),
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 8, 255  , 100),
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
                            Icons.lock,
                            color: Color.fromRGBO(0, 54, 249 , 100),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: FloatingActionButton(

                                  backgroundColor: Colors.blueAccent
                                  ,onPressed: () {
                                setState(() {
                                  if(icon==Icons.visibility_off)
                                  {
                                    view=false;
                                    icon=Icons.visibility;
                                  }
                                  else
                                  {
                                    view=true;
                                    icon=Icons.visibility_off;
                                  }
                                });

                              },
                                  child: Icon(icon,color: Colors.deepPurple)),
                            ),
                          ),
                          labelText: 'PassWord',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 54, 249 , 100),
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

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: (){
                        db.insertdatabase(name.text,  nameController.text, passwordController.text).then((value) => print("value ${value}"));

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>LoginPage()));
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color.fromRGBO(0, 8, 255 , 0.3),
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