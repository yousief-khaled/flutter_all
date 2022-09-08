//import 'package:all_taskes/first_page.dart';
//import 'package:all_taskes/looooon.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//void main()
//{
  //runApp(MaterialApp(
    //  home:(task())
  //));
//}
import 'package:all_taskes/project2/login%20firebase.dart';
import 'package:all_taskes/project3copy2_firebase/test/api/api2.dart';
import 'package:all_taskes/project3copy2_firebase/test/intro_page.dart';
import 'package:all_taskes/project3copy2_firebase/test/login.dart';
import 'package:all_taskes/project3copy2_firebase/regester.dart';
import 'package:all_taskes/project3copy2_firebase/test/show_practice.dart';
import 'package:all_taskes/project3copy2_firebase/test/test.dart';
import 'package:all_taskes/socnd_page.dart';
import 'package:all_taskes/test_vedio.dart';
import 'package:all_taskes/testvedieo2.dart';
import 'package:all_taskes/uploud%20and%20get%20image/getimage.dart';
import 'package:all_taskes/uploud%20and%20get%20image/uploudeimage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'chow_practc2.dart';
import 'first_page.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false ,
        home:   LoginPage_fire()); //bmiscreen());
  }
}
