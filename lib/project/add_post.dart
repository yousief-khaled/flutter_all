import 'package:all_taskes/class/class_account.dart';
import 'package:all_taskes/database/data1.dart';
import 'package:all_taskes/project/show_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class cc extends StatefulWidget{
  Account currentAccount;
  cc({required this.currentAccount});
  @override
  _ccState createState() => _ccState();
}

class _ccState extends State<cc> {
  DatabaseHelp db =new DatabaseHelp();
  final urlimage='https://i.pinimg.com/originals/5c/cd/75/5ccd7544f3908ca293f66e9b186015df.jpg';

  TextEditingController postController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.creatdatabase();
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
                        onPressed: () {
                          db.addpost(postController.text,widget.currentAccount.customerName).then((value) {

                            print(value);


                          });

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
                          db.get_posts().then((value) {
                            print(value);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return showpost(
                                    currentAccount: Account(id:widget.currentAccount.id ,
                                        customerName: widget.currentAccount.customerName,
                                        email:widget.currentAccount.email ,
                                        Password: widget.currentAccount.Password), x: value,
                                  );
                                }));
                          });

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