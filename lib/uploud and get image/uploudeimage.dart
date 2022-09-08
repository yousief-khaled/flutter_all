import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadItem extends StatefulWidget {
  @override
  _UploadItemState createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  TextEditingController _ItemNameController = new TextEditingController();

  final _picker = ImagePicker();
  PickedFile? image;
  var file;
  GetImage() async {
    await Permission.photos.request();
    var status = await Permission.photos.status;
    if (status.isGranted) {
      image = await _picker.getImage(source: ImageSource.gallery);
      file = File(image!.path);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Hat permission")));
    }
  }

  UploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    if (image != null) {
      await _firebaseStorage
          .ref("Images/${_ItemNameController.text}")
          .putFile(file)
          .whenComplete(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Uploaded successfully :)")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Add Item",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            Container(
              width: width * 0.7,
              height: heigth * 0.4,
              color: Colors.indigo,
              child: file != null
                  ? Image.file(
                file,
                fit: BoxFit.fill,
              )
                  : SizedBox(),
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
                if (file == null)
                  await GetImage();
                else {
                  await UploadImage();
                  //TODO Push notification here
                }
              },
              child: Text(file == null ? "Get Image" : "Upload Image"),
            )
          ],
        ),
      ),
    );
  }
}
