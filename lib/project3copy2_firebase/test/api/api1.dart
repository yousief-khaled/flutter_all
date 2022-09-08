import 'package:flutter/material.dart';

class bmi_result extends StatelessWidget {
  double? result;
  String? advice;
  String? state;
  var color;

  bmi_result({required this.result}) {
    if (result! < 18.5) {
      this.color = Colors.red;
      this.state = 'Underweight';
      this.advice = 'You need to gain weight';
    } else if (result! >= 18.5 && result! <= 24.9) {
      this.color = Colors.green;
      this.state = 'Normal';
      this.advice = 'You are perfect';
    } else if (result! >= 25 && result! <= 29.9) {
      this.color = Colors.red;
      this.state = 'Overweight';
      this.advice = 'You need to lose weight';
    } else {
      this.color = Colors.red;
      this.state = 'Obese';
      this.advice = 'You need to lose weight and go to GYM';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(16, 22, 57, 1),
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromRGBO(12, 17, 53, 1),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Row(
                children: [
                  Text(
                    'Your Result',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(39, 43, 78, 1),
              ),
              width: double.infinity,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(60),
              child: Column(
                children: [
                  Text(
                    state!,
                    style: TextStyle(
                        fontSize: 30,
                        color: color,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    '$result',
                    style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 70),
                  Text(
                    advice!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
