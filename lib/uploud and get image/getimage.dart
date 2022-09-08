import 'package:all_taskes/uploud%20and%20get%20image/surevices/notefecation.dart';
import 'package:flutter/material.dart';

import 'imageithem.dart';


class GetImage extends StatefulWidget{
  @override
  _GetImageState createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  NotificationService notificationService = NotificationService();
  bool y=false;
  TextEditingController _ItemNameController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService.Initialize();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Get Item",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            Container(
              width: width * 0.7,
              height: heigth * 0.4,
              color: Colors.indigo,
              child:y==false?SizedBox():ImageItem(_ItemNameController.text),
            ),
            Container(
              width: width / 2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 1.5),
                  borderRadius: BorderRadius.circular(22)),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.01),
                child: TextField(
                  controller: _ItemNameController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Item name"),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () async {
                //TODO Notification
                notificationService.InstanceNotification();

                setState(() {
                  y=true;
                });

              },
              child: Text("Get Image"),
            )
          ],
        ),
      ),
    );
  }
}