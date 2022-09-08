import 'package:all_taskes/fire_base/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Auth{
  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future SignIn(String email,String password)async{
    try{
      UserCredential res= await _auth.signInWithEmailAndPassword(email: email, password: password);
      UserData.username=res.user!.email as String;
      UserData.username=email;
      final name = await FirebaseFirestore.instance.collection('AccountModel').doc(UserData.username).get();
      UserData.name=name['name'];

      return true;
    }on FirebaseAuthException catch(e)
    {
      print(e.code);
      return false;
    }
  }
  Future SignUp(String email,String password)async{
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
     // UserData.username=email;
      return true;
    }
    on FirebaseAuthException catch(e)
    {
      print("catch");

      print(e.code);
      return false;
    }
  }
}