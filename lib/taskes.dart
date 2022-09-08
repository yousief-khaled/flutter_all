import 'package:flutter/material.dart';


import 'alwan.dart';
import 'gride.dart';

class listt extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return practice();

  }

}
class practice extends State<listt> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home:Scaffold(
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "item $index",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                color: Colors.red,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                color: Colors.orange,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return GridPage();
                                  }));
                            }, onLongPress: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return (app());
                              }));
                        },
                            child: Text("Click Me"))
                      ],
                    ),
                  ),
                );
              }),
        )

    );
  }
}
