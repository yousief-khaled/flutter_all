import 'package:flutter/material.dart';

import 'looon sours.dart';
import 'looon2.dart';
import 'looooon3.dart';
class ee extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return page();
     }

}
class page extends State<ee>{
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(

        body: Container(

          width: scwidth,
          height: scheight,
         child: Container(

           child: CustomPaint(

             painter: drawer(),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(bottom: 100),
                   child: Container(
                     height: 50,
                     width: 200,
                     child: ElevatedButton(onPressed: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>eeee()));

                     }, child:Text("Don't click (:",style: TextStyle(fontSize: 30),),),
                   ),
                 ),
               ],
             )
           ),
         ),

        ),
      )

    );
  }


}
