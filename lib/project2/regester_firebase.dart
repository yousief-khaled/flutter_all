import 'package:all_taskes/class/class_firebase/account_fire.dart';
import 'package:all_taskes/fire_base/Auth.dart';
import 'package:all_taskes/fire_base/firestore.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  Database2 _db = new Database2();
  Auth _auth = new Auth();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          Container(
              width: scwidth,
              height: scheight * 0.3,
              child: Center(
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: scwidth * 0.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Container(
            width: scwidth * 0.9,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'This field cannot be empty!';
                    },
                  ),
                  SizedBox(
                    height: scheight * 0.03,
                  ),
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
                  SizedBox(
                    height: scheight * 0.03,
                  ),
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
                  SizedBox(
                    height: scheight * 0.03,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        //TODO create new account
                        await _auth.SignUp(_usernameController.text,
                            _passwordController.text,)
                            .then((value) {
                          if (value == true) {
                            _db.SaveAccount(AccountModel(
                                username: _usernameController.text,
                                password: _passwordController.text,
                                name: _nameController.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Success")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("failed")));
                          }
                        });
                      }
                    },
                    minWidth: scwidth * 9,
                    height: scheight * 0.07,
                    color: Colors.indigo,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
          ),
          CheckboxListTile(
              title: Text(
                'Remember Me',
                style: TextStyle(color: Colors.white),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.blue,
              activeColor: Colors.white,
              selected: _rememberMe,
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value as bool;
                });
              }),
        ],
      ),
    );
  }
}
