import 'package:all_taskes/first_page.dart';
import 'package:all_taskes/project3copy2_firebase/test/show%20veduo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../class/data.dart';

class cont extends StatefulWidget {
  Map index;
  //final VideoPlayerController playerController;
  cont(this.index);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<cont> {
  VideoPlayerController? postconroler;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
          //color: Color.fromRGBO(1000, 1000, 1000, 200),
          image: DecorationImage(
              image: AssetImage(widget.index['imagepath']),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],

        ),


        width: 350,
        height: 100,

        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        show_veduo(widget.index)));
          },
          child: Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                  Text(
                    widget.index['name'],
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),

                  ),


                  Text(
                    widget.index['time'],
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      color: Colors.white

                    ),
                  ),

              ],
            ),
          ),
        ));
  }
}
