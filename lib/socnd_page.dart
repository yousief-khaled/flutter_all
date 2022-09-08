


import 'package:all_taskes/first_page.dart';
import 'package:all_taskes/project3copy2_firebase/test/login.dart';


import 'package:all_taskes/taskes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alwan.dart';
import 'calco.dart';

import 'looooon.dart';
import 'project/logian.dart';
class task2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return page();

  }



}
class page extends State<task2>{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(

     home: Scaffold(
       body:Container(
         height: 900,
         decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/yoyo.jpg'),
               fit: BoxFit.cover,
             )
         ),

         child: Center( child:

           ListView( children:[
           Padding(
             padding: const EdgeInsets.only(bottom: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 40,left: 70),
                   child: Container(
                     width: 300,

                     child: Text("Our Apps",style: TextStyle(fontSize: 50,color: Colors.lightBlue),),

                   ),
                 ),
               ],

             ),
           ),
           Row(
             children: [
               Container(
                 height: 80,
                 width: 200,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only( topRight:Radius.circular(150),bottomRight:Radius.circular(150)),
                   color: Color.fromRGBO(123, 194, 227, 100),
                 ),
                 child: GestureDetector(
                   onTap: () {

                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Calc()));

                   },
                   child:Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Container(child: Image(image: AssetImage('assets/images/calc.png'),),
                           height: 50,width: 50,)

                       ],
                     ),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [


                         Container(child: Text("calcolater",style: TextStyle(fontSize: 20),),height: 20,)

                       ],),



                   ],

                 ),

                 )),



             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Container(
                 height: 80,
                 width: 200,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only( topLeft:Radius.circular(150),bottomLeft:Radius.circular(150)),
                   color: Color.fromRGBO(45, 83, 238,100),
                 ),
                 child:GestureDetector(
                   onTap: () {

                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>app()));

                   },
                   child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Container(child: Image(image: AssetImage('assets/images/task.png'),),
                           height: 50,width: 50,)

                       ],
                     ),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [


                         Container(child: Text("Taskes",style: TextStyle(fontSize: 20),),height: 20,)

                       ],)

                   ],

                 ),

                 ) ),



             ],
           ),
             Row(
               children: [
                 Container(
                     height: 80,
                     width: 200,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only( topRight:Radius.circular(150),bottomRight:Radius.circular(150)),
                       color: Color.fromRGBO(123, 194, 227, 100),
                     ),
                     child: GestureDetector(
                       onTap: () {

                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>LoginPage()));

                       },
                       child:Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Container(child: Image(image: AssetImage('assets/images/face.png'),
                                 height: 50,width: 50,)

                               )],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [


                               Container(child: Text("FaceBook",style: TextStyle(fontSize: 20),),height: 20,)

                             ],),



                         ],

                       ),

                     )),



               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Container(
                     height: 80,
                     width: 200,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only( topLeft:Radius.circular(150),bottomLeft:Radius.circular(150)),
                       color: Color.fromRGBO(0, 70, 242,100),
                     ),
                     child:GestureDetector(
                       onTap: () {

                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>ee()));

                       },
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                                CircleAvatar(child:Image(image: AssetImage('assets/images/th.jpg'),),radius: 25, )


                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [


                               Container(child: Text("draws",style: TextStyle(fontSize: 20),),height: 20,)

                             ],)

                         ],

                       ),

                     ) ),



               ],
             ),
             Row(
               children: [
                 Container(
                     height: 80,
                     width: 200,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only( topRight:Radius.circular(150),bottomRight:Radius.circular(150)),
                       color: Color.fromRGBO(123, 194, 227, 100),
                     ),
                     child: GestureDetector(
                       onTap: () {

                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>LoginPage_fire()));

                       },
                       child:Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Container(child: Image(image: AssetImage('assets/images/face.png'),),
                                 height: 50,width: 50,)

                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [


                               Container(child: Text("Facebook_fire",style: TextStyle(fontSize: 20),),height: 20,)

                             ],),



                         ],

                       ),

                     )),



               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Container(
                     height: 80,
                     width: 200,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only( topLeft:Radius.circular(150),bottomLeft:Radius.circular(150)),
                       color: Color.fromRGBO(45, 83, 238,100),
                     ),
                     child:GestureDetector(
                       onTap: () {

                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>()));

                       },
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Container(child: Image(image: AssetImage('assets/images/task.png'),),
                                 height: 50,width: 50,)

                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [


                               Container(child: Text("Taskes",style: TextStyle(fontSize: 20),),height: 20,)

                             ],)

                         ],

                       ),

                     ) ),



               ],
             ),



           ])

         ),
       ),


     ),
   );

  }



}