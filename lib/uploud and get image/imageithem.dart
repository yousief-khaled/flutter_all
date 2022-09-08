import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class ImageItem extends StatefulWidget{
  String imageName;
  ImageItem(this.imageName);
  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  var PhotosRef=FirebaseStorage.instance.ref("Images");
  Uint8List? ImageBytes;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageFromStorage();
  }

  getImageFromStorage()async{
    PhotosRef.child(widget.imageName as String).getData(7*1024*1024).then((value) {{
      setState(() {
        ImageBytes=value;
      });
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ImageBytes!=null?Image.memory(ImageBytes as Uint8List,fit: BoxFit.fill,):CircularProgressIndicator();
  }
}