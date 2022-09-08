

import 'package:all_taskes/socnd_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class task extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return page();
  }
}

class page extends State<task> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 50),
                  child: Container(
                    height: 100,
                    width: 300,
                    child: Text(
                      "Flutter training",
                      style: TextStyle(
                          fontSize: 40, color: Colors.deepPurpleAccent),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 200,
                  child: Image(
                    image: AssetImage('assets/images/image1.png'),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => task2()));
                    },
                    child: Text("Get Started",style: TextStyle(fontSize: 30),)


                    ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
