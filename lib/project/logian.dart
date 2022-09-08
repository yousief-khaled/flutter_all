import 'package:all_taskes/class/class_account.dart';
import 'package:all_taskes/database/data1.dart';
import 'package:all_taskes/project/regester.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'add_post.dart';


class LoginPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {

  bool view=false;
  var icon=Icons.visibility;
  bool rememberMeBool = false;
  final _keyForm = GlobalKey<FormState>();
  DatabaseHelp db =new DatabaseHelp();
  final urlimage='https://i.pinimg.com/originals/5c/cd/75/5ccd7544f3908ca293f66e9b186015df.jpg';
  bool _isSelected=false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences _preferences;


  void initState() {
    db.creatdatabase();




  }
  saveData() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setStringList('AccountModel', [nameController.text, passwordController.text]);
  }
  getData()async{
    _preferences = await SharedPreferences.getInstance();
    List? accountData = _preferences.get('AccountModel') as List?;
    if(accountData!.isNotEmpty){
      setState(() {
        nameController.text = accountData[0];
        passwordController.text = accountData[1];
        rememberMeBool = true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    if(nameController.text.isEmpty && rememberMeBool){
      getData();
    }
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
            padding: const EdgeInsets.only(top: 200,left: 10,right: 10,bottom: 100),
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
                        'Login page ',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
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
                  Padding(
                    padding: EdgeInsets.only(left:  20),
                    child: ListTile(
                        title: Row(
                          children: [
                            Checkbox(
                                value: rememberMeBool,
                                onChanged: (val) {
                                  setState(() {
                                    rememberMeBool = val as bool;
                                  });
                                }),
                            Text("Remember Me",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        db.get_account(nameController.text, passwordController.text).then((value) async {

                          print(value);
                          if(value.isNotEmpty)
                          {if(rememberMeBool)
                            await saveData();

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Logged in Successfully!")));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>cc(
                                    currentAccount: Account(id:value[0]['id'] ,
                                        customerName: value[0]['name'],
                                        email:value[0]['username'] ,
                                        Password: value[0]['password'])
                                ),
                              ));


                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Failed!')));
                          }
                        });

                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color.fromRGBO(0, 8, 255 , 0.3),
                      child: Text(
                        'LOGIN',
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
                      child: Row(
                        children: <Widget>[
                          Text('Does not have account?'),
                          FlatButton(
                            textColor: Colors.blue,
                            child: Text(
                              'Sign up',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Regester()));
                            },
                            //signup screen

                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}