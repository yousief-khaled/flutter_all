import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    Rect rect = new Rect.fromPoints(
        Offset(0, size.height), Offset(size.width, size.height));

    paint.shader = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.blue,
        Colors.pink,
      ],
    ).createShader(rect);
    //Image(image: AssetImage('assets/images/yoyo.jpg'));



    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    var path = new Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(
        size.width / 2, size.height , size.width,0);


    canvas.drawPath(path, paint);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}