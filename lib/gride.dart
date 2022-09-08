import 'package:flutter/material.dart';
class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            itemCount: 100,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.yellow,
                child: Center(child: Text("Cell ${index + 1}")),
              );
            }));
  }
}




