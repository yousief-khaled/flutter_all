import 'package:all_taskes/chow_practc2.dart';
import 'package:all_taskes/project3copy2_firebase/test/show_practice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class show_levels extends StatefulWidget {
  int id;
  show_levels(this.id);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<show_levels> {
  @override
  Widget build(BuildContext context) {
    int esey=1;
    int normal=2;
    int advanced=3;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text("Levels"),
        backgroundColor: Colors.brown,
      ),
        body: Container(

      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>show_practice(widget.id,esey)));
            },
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //color: Color.fromRGBO(1000, 1000, 1000, 200),
                image: DecorationImage(
                    image: AssetImage("assets/backktf/back1.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.darken)),
              ),
              child: Center(
                child: Text(
                  "Easy Level",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>show_practice(widget.id,normal)));

            },
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //color: Color.fromRGBO(1000, 1000, 1000, 200),
                image: DecorationImage(
                    image: AssetImage("assets/backktf/back2.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.darken)),
              ),
              child: Center(
                child: Text(
                  "Normal Level",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>show_practice(widget.id,advanced)));

            },
            child: Container(

              height: 200,
              width: 400,
              decoration: BoxDecoration(
                //color: Colors.brown,
                borderRadius: BorderRadius.circular(50),
                //color: Color.fromRGBO(1000, 1000, 1000, 200),
                image: DecorationImage(
                    image: AssetImage("assets/backktf/im17.jpeg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.darken)),
              ),
              child: Center(
                child: Text(
                  "Advanced Level",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
