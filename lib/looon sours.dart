import 'package:flutter/material.dart';

import 'looon2.dart';
import 'looooon3.dart';
class eeee extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return page();
  }

}
class page extends State<eeee>{
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

                  painter: page2(),

              ),
            ),

          ),
        )

    );
  }


}
