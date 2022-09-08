import 'dart:developer';

import 'package:all_taskes/taskes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class app extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return myapp();
  }
}

class myapp extends State<app> {
  String s = '';
  int v = 0;
  int count = 0;
  Color x=Colors.white;
  void increment(int c,Color aa) {
    setState(() {
      v = c;
      x=aa;
    });
  }

//setState(() {
//       backgroundColor: c;
//     });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: x,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$v", style: TextStyle(fontSize: 50, color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.orange,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(1,Colors.orange);
                        },
                        child:
                        Text('1', style: TextStyle(fontSize: 50, color: Colors.white)),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(2,Colors.red);
                        },
                        child:
                        Text('2', style: TextStyle(fontSize: 50, color: Colors.white)),
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(3,Colors.black);
                        },
                        child:
                        Text('3', style: TextStyle(fontSize: 50, color: Colors.white)),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.yellowAccent,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(4,Colors.yellowAccent);
                        },
                        child:
                        Text('4', style: TextStyle(fontSize: 50, color: Colors.white)),
                      ),
                    ),
                    Container(
                      color: Colors.cyanAccent,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(5,Colors.cyanAccent);
                        },
                        child:
                        Text('5', style: TextStyle(fontSize: 50, color: Colors.white)),
                      ),
                    ),
                    Container(
                      color: Colors.deepPurpleAccent,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(6,Colors.deepPurpleAccent);
                        },
                        child:
                        Text('6', style: TextStyle(fontSize: 50, color: Colors.white)),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.lightGreen,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(7,Colors.lightGreen);
                        },
                        child: Text(
                          '7',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.brown,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(8,Colors.brown);
                        },
                        child:
                        Text('8', style: TextStyle(fontSize: 50, color: Colors.white)),
                      ),
                    ),
                    Container(
                      color: Colors.pink,
                      width: 80,
                      height: 80,
                      child: OutlineButton(
                        onPressed: () {
                          increment(9,Colors.pink);
                        },
                        child:
                        Text('9', style:TextStyle(fontSize: 50, color: Colors.white)),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>listt()));
          },child: Text("Don't Click",style:TextStyle(fontSize:20 ) ,),),),

                  ],
                )
              ],
            ),
          ),
        ));
  }
}
