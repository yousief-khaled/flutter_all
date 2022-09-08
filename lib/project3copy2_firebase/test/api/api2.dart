import 'dart:math';
import 'package:flutter/material.dart';

import 'api1.dart';


class bmiscreen extends StatefulWidget {
  @override
  _bmiscreenState createState() => _bmiscreenState();
}

var font_color_male = Color.fromRGBO(187, 189, 206, 1);
var font_color_female = Color.fromRGBO(187, 189, 206, 1);

class _bmiscreenState extends State<bmiscreen> {
  double height = 120;
  int weight = 50;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(16, 22, 57, 1),
      ),
      body: Container(
        color: const Color.fromRGBO(12, 17, 53, 1),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(39, 43, 78, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              color: font_color_male,
                              image: const AssetImage(
                                'assets/images/male.png',
                              ),
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 25,
                                color: font_color_male,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (font_color_male ==
                              Color.fromRGBO(187, 189, 206, 1)) {
                            font_color_male = Color.fromRGBO(255, 0, 103, 1);
                            font_color_female =
                                Color.fromRGBO(187, 189, 206, 1);
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(39, 43, 78, 1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              color: font_color_female,
                              image: const AssetImage(
                                'assets/images/female.png',
                              ),
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 25,
                                color: font_color_female,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (font_color_female ==
                              Color.fromRGBO(187, 189, 206, 1)) {
                            font_color_female = Color.fromRGBO(255, 0, 103, 1);
                            font_color_male = Color.fromRGBO(187, 189, 206, 1);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(39, 43, 78, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(187, 189, 206, 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Color.fromRGBO(255, 0, 103, 1),
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      max: 220,
                      min: 80,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 43, 78, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                                color: Color.fromRGBO(187, 189, 206, 1),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  heroTag: '1',
                                  backgroundColor:
                                  Color.fromRGBO(33, 39, 71, 1),
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 30) weight--;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                  )),
                              SizedBox(width: 5),
                              FloatingActionButton(
                                heroTag: '2',
                                backgroundColor: Color.fromRGBO(33, 39, 71, 1),
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(39, 43, 78, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                                color: Color.fromRGBO(187, 189, 206, 1),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  heroTag: '3',
                                  backgroundColor:
                                  Color.fromRGBO(33, 39, 71, 1),
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 10) age--;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                  )),
                              SizedBox(width: 5),
                              FloatingActionButton(
                                heroTag: '4',
                                backgroundColor: Color.fromRGBO(33, 39, 71, 1),
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(255, 0, 103, 1),
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              width: double.infinity,
              child: FlatButton(
                height: 50,
                splashColor: Color.fromRGBO(255, 0, 103, 0.1),
                onPressed: () {
                  double res = weight / pow(height / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          bmi_result(result: rounddouble(res, 1)),
                    ),
                  );
                },
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

rounddouble(double res, int i) {
  num mod = pow(10.0, i);
  return ((res * mod).round().toDouble() / mod);
}
