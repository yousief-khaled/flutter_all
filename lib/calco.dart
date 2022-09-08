import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  Calculations c = new Calculations();
  var backgroundc = Colors.black87;
  var backicon = Icons.wb_incandescent_outlined;
  var zrar = Colors.white;
  var backzrar = Colors.black;


  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (backgroundc == Colors.black87) {
                  backgroundc = Colors.white60;
                  backicon = Icons.wb_incandescent;
                  zrar = Colors.black;
                  backzrar = Colors.white;
                } else {
                  backgroundc = Colors.black87;
                  backicon = Icons.wb_incandescent_outlined;
                  zrar = Colors.white;
                  backzrar = Colors.black;
                }
              });
            },
            child: Icon(backicon),
            backgroundColor: Color.fromRGBO(202, 75, 14, 1),
          )
        ],
      ),
      body: Container(
        width: scwidth,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: scwidth,
                height: scheight * 0.38,
                color: backgroundc,
                child: Center(
                  child: Text(
                    c.res,
                    style: TextStyle(color: zrar, fontSize: 30),
                  ),
                ),
              ),
            ),
            Container(
                width: scwidth,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            c.point = 0;
                            setState(() {
                              c.Clr();
                              c.chk=0;
                              c.countt = 0;
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "C",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {

                              c.point = 0;
print("chek ${c.chk}");

                              if (c.countt == 0&&c.res.length!=1) {
                                print(c.res.length);
                                c.res =
                                    c.res.substring(0, c.res.length - 1);
                                if(c.res=='-')
                                {


                                  print("chek $c.chk");

                                }else {
                                  if(c.res=='-')
                                  {

                                  }else {



                                    if (c.state == 0) {
                                      c.num1 = double.parse(c.res);
                                    } else if (c.state == 1) {
                                      c.num2 = double.parse(c.res);
                                    }

                                  }
                                }



                              } else {

                                if(c.res.length==1)
                                {
                                  c.res="";
                                  c.chk=0;
                                }
                                print("mynf3sh");
                              }
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Icon(
                                Icons.backspace,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.hande(5);
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "%",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.hande(4);
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "/",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //2nd row
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              print(c.countt);
                              c.chk=1;
                              if (c.countt != 0) {
                                print("mynf3sh");
                              } else {
                                c.res += "7";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "7",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if (c.countt != 0) {
                                print("mynf3sh");
                              } else {
                                c.res += "8";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "8",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if (c.countt != 0) {
                                print("mynf3sh");
                              } else {
                                c.res += "9";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "9",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.hande(1);

                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "*",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //3 row
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            c.chk=1;
                            if (c.countt != 0) {
                              print("mynf3sh");
                            } else {
                              setState(() {
                                c.res += "4";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              });
                            }
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if(c.countt!=0)
                              {
                                print("mynf3sh");
                              }
                              else {
                                c.res += "5";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }});
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if(c.countt!=0)
                              {
                                print("mynf3sh");
                              }
                              else {
                                c.res += "6";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }});
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "6",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                           setState(() {
                             c.hande(2);
                           });
                          },
                          child: Container(
                            width: scwidth / 8,
                            height: scheight * 0.1,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "--",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              print("chk=$c.chk");
                              if(c.chk==0) {
                                c.res = "-";
                              }
                            });


                          },
                          child: Container(
                            width: scwidth / 8,
                            height: scheight * 0.1,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //4th row
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if(c.countt!=0)
                              {
                                print("mynf3sh");
                              }
                              else {
                                c.res += "1";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }});
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if(c.countt!=0)
                              {
                                print("mynf3sh");
                              }
                              else {
                                c.res += "2";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }});
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if(c.countt!=0)
                              {
                                print("mynf3sh");
                              }
                              else {
                                c.res += "3";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }});
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.hande(3);
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //5th row
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if(c.countt!=0)
                              {
                                print("mynf3sh");
                              }
                              else {
                                c.res += "0";
                                if (c.state == 0)
                                  c.num1 = double.parse(c.res);
                                else
                                  c.num2 = double.parse(c.res);
                              }});
                          },
                          child: Container(
                            width: scwidth / 2,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                "0",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              c.chk=1;
                              if(c.countt!=0)
                              {
                                print("mynf3sh");
                              }
                              else {
                                if (c.point == 0) {
                                  c.res += ".";
                                  if (c.state == 0)
                                    c.num1 = double.parse(c.res);
                                  else
                                    c.num2 = double.parse(c.res);
                                } else {
                                  print("mynf3sh");
                                }
                                c.point++;
                              }});
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: backzrar,
                            child: Center(
                              child: Text(
                                ".",
                                style: TextStyle(fontSize: 22, color: zrar),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (c.state == 1 && c.op != 0) {
                                if (c.op == 1) {
                                  c.Mul();
                                } else if (c.op == 2) {
                                  c.Sub();
                                } else if (c.op == 3) {
                                  c.Add();
                                } else if (c.op == 4) {
                                  if (c.num2 == 0) {
                                    print("mynf#sh");
                                    print(c.res);
                                    setState(() {
                                      c.Clr();
                                      c.res = "Math Error :(";
                                    });
                                  } else {
                                    c.Div();
                                  }
                                } else if (c.op == 5) {
                                  c.Mod();
                                }
                              }
                              c.num1 = double.parse(c.res);
                              c.state = 0;
                              c.countt++;
                            });
                          },
                          child: Container(
                            width: scwidth / 4,
                            height: scheight * 0.1,
                            color: Color.fromRGBO(202, 75, 14, 1),
                            child: Center(
                              child: Text(
                                "=",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class Calculations {
  double num1 = 0;
  double num2 = 0;
  int op = 0;
  String res = "";
  int state = 0;
  int countt = 0;
  int point = 0;
 int chk=0;
  Add() {
    res = (num1 + num2).toString();
    if(res=="-0.0")
      {
        res="0.0";

      }
  }

  Sub() {
    res = (num1 - num2).toString();
    if(res=="-0.0")
    {
      res="0.0";

    }
  }

  Div() {
    if(num1==0)
      {res="0.0"; }
    else {
      res = (num1 / num2).toString();
      if(res=="-0.0")
      {
        res="0.0";

      }
    }
  }

  Mul() {

    res = (num1 * num2).toString();
    if(res=="-0.0")
    {
      res="0.0";

    }
  }

  Mod() {
    res = (num1 % num2).toString();
    if(res=="-0.0")
    {
      res="0.0";

    }
  }

  Clr() {
    res = "";
    state = 0;
    num1 = 0;
    num2 = 0;
    op = 0;
  }

  hande(int x) {
    chk=0;
    state = 1;
    op = x;
    res = "";
    countt = 0;
    point = 0;
  }
}
