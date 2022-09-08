import 'dart:ui';

import 'package:all_taskes/project3copy2_firebase/test/page_gym.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class intropage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<intropage> {
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(

      body: Container(
        height: scheight,
        width: scwidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backgrounds.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(150),
                      bottomLeft: Radius.circular(150)),
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fitness Gym",
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.brown.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  width: 230,
                  height: 120,
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: () async {

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>page_gym()));

                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    child: Text("Let's Start",
                        style: TextStyle(
                            letterSpacing: 1.5,
                            fontFamily: 'OpenSans',
                            fontSize: 30,
                            color: Colors.brown.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
