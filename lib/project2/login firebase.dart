import 'package:all_taskes/fire_base/Auth.dart';
import 'package:all_taskes/project2/regester_firebase.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';



class LoginPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage2> {
  Auth _auth=new Auth();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: scwidth,
                height: scheight * 0.3,
                child: Center(
                  child: Text(
                    'Facebook',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: scwidth*0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
            Container(
              width: scwidth*0.9,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'This field cannot be empty!';
                      },
                    ),
                    SizedBox(height: scheight*0.03,),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'This field cannot be empty!';
                      },
                    ),
                    SizedBox(height: scheight*0.03,),
                    MaterialButton(
                      onPressed: ()async{
                        if(_formKey.currentState!.validate()){
                          //TODO authenticate user
                          await _auth.SignIn(_usernameController.text, _passwordController.text).then((value){
                            if(value==true)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageeq()));
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("failed")));

                            }
                          });
                        }
                      },
                      minWidth: scwidth*9,
                      height: scheight*0.07,
                      color: Colors.indigo,
                      child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 22),),
                    )
                  ],
                ),
              ),
            ),
            CheckboxListTile(
                title: Text('Remember Me',style: TextStyle(color: Colors.white),),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.blue,
                activeColor: Colors.white,
                selected: _rememberMe,
                value: _rememberMe,
                onChanged: (value){
                  setState(() {
                    _rememberMe=value as bool;
                  });
                }
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>SignUpPage()));
              },
              child: Text('Sign Up for Facebook', style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 18
              ),),
            )
          ],
        ),
      ),
    );
  }
}
