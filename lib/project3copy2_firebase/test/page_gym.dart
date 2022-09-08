import 'package:all_taskes/fire_base/userdata.dart';
import 'package:all_taskes/project3copy2_firebase/test/setting.dart';
import 'package:all_taskes/project3copy2_firebase/test/show%20levels.dart';
import 'package:all_taskes/project3copy2_firebase/test/show_practice.dart';
import 'package:all_taskes/project3copy2_firebase/test/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../chow_practc2.dart';
import 'api/api2.dart';
import 'intro_page.dart';
import 'login.dart';

class page_gym extends StatefulWidget {
  var file51;
  page_gym([this.file51]);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<page_gym> {
 late final  name ;
  var file3;


  cheakimageforuser() async {
    bool d = false;

    for (int i = 0; i < vvv.arrypath!.length; i++) {
      if (UserData.username == vvv.arrypath![i]) {
        d = true;
        break;
      } else {
        d = false;
      }
    }
    if (d == true) {
      var name = await FirebaseFirestore.instance
          .collection('pathimage')
          .doc(UserData.username)
          .get();
      print(
          "${name['username']} dsaaaaaaaaaaaaaaaaadsaaaaaaaaaaaaa4654465456 ");

      if (name['username'] != null && name['username'] == UserData.username) {
        file3 = name['path'];
        widget.file51 = file3;
        print(
            "fileeeeeeeeeeeeeeeeeee**********/*/*//*/*/*/*/********** $file3");
      } else {
        file3 = null;
        widget.file51 = file3;
      }
    } else {
      file3 = null;
      widget.file51 = file3;
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    int arm=1;
    int shoulder=2;
    int leges=3;
    int chest =4;
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness"),
        backgroundColor: Colors.brown,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => intropage()));
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        actions: [
          FloatingActionButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage_fire()));

          },
            backgroundColor: Colors.brown, child: Icon(Icons.home_rounded),
          )
        ],
      ),
      body: Container(
        height: scheight,
        width: scwidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background15.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken)),
        ),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: GestureDetector(
                        onTap: () async {
                          await cheakimageforuser();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      bmiscreen()));
                          setState(() {});
                        },
                        //color: Color.fromRGBO(132, 98, 0, 0),

                        child: Container(
                          width: 200,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(300),
                                bottomRight: Radius.circular(0),
                                bottomLeft: Radius.circular(300)),
                            color: Color.fromRGBO(132, 98, 0, 0.2),
                          ),

                          child: Center(
                              child: Text(
                            "Bmi Calculator",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontStyle: FontStyle.italic),
                          )),
                        )),
                  ),
                  SizedBox(
                    width: 2.2,
                  ),
                  Container(
                    width: 190,
                    child: GestureDetector(
                        onTap: () async {
                          await cheakimageforuser();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage50(widget.file51)));
                          setState(() {});
                        },
                        //color: Color.fromRGBO(132, 98, 0, 0),

                        child: Container(
                          width: 200,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                topLeft: Radius.circular(300),
                                bottomRight: Radius.circular(300),
                                bottomLeft: Radius.circular(0)),
                            color: Color.fromRGBO(132, 98, 0, 0.2),
                          ),

                          child: Center(
                              child: Container(
                                child: Text(
                                  "Gym Chat",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown,
                                      fontStyle: FontStyle.italic),
                                ),
                              )),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),

              Row(
                children: [

                     GestureDetector(
                      child: Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(39, 43, 78, 1),
                          image: DecorationImage(
                              image: AssetImage('assets/images/shoulder.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2), BlendMode.darken)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [


                            Padding(
                              padding: const EdgeInsets.only(bottom: 7.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10) ),
                                  color: Colors.grey,

                                ),

                                width: 150,

                                child: Text(
                                  'Shoulder',textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>show_levels(shoulder)));
                      },
                    ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(39, 43, 78, 1),
                        image: DecorationImage(
                            image: AssetImage('assets/images/arm.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2), BlendMode.darken)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [


                          Padding(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10) ),
                                color: Colors.grey,

                              ),
                              width: 150,
                              child: Text(
                                'Arm',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>show_levels(arm)));
                    },
                  ),





                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [

                  GestureDetector(
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(39, 43, 78, 1),
                        image: DecorationImage(
                            image: AssetImage('assets/images/pinging.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2), BlendMode.darken)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [


                          Padding(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10) ),
                                color: Colors.grey,

                              ),
                              width: 150,
                              child: Text(
                                'Chest',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>show_levels(chest)));
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(39, 43, 78, 1),
                        image: DecorationImage(
                            image: AssetImage('assets/images/leg.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2), BlendMode.darken)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [


                          Padding(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10) ),
                                color: Colors.grey,

                              ),
                              width: 150,
                              child: Text(
                                'Leg',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>show_levels(leges)));
                    },
                  ),





                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
