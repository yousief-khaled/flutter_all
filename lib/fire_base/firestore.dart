import 'package:all_taskes/class/class_firebase/account_fire.dart';
import 'package:all_taskes/class/class_firebase/post_model.dart';
import 'package:all_taskes/fire_base/userdata.dart';
import 'package:all_taskes/project3copy2_firebase/test/setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Database2{

  CollectionReference AccountsRef=FirebaseFirestore.instance.collection("AccountModel");
  CollectionReference PostsRef=FirebaseFirestore.instance.collection("PostModel");
  CollectionReference massage=FirebaseFirestore.instance.collection("massage");
  CollectionReference pathimage=FirebaseFirestore.instance.collection("pathimage");
  CollectionReference data=FirebaseFirestore.instance.collection("data");



  SaveAccount(AccountModel acc)async{

print("savepost");
    await AccountsRef.doc(acc.username).set(acc.toMap());
  }

  SavePost(PostModel post)async{
    await PostsRef.doc().set(post.toMap());
  }

  getPosts() async {
    return await PostsRef.snapshots();
  }

  updateLike(PostModel post){
    print("updated ");
    PostsRef.doc(post.postID).update({
      'liked':post.liked,
      'NumOfLikes':post.NumOfLikes
    });
  }
  updatedLike(PostModel post){
    PostsRef.doc(post.postID).update({
      'liked':post.liked,
      'NumOfdLikes':post.NumOfdLikes

    });
  }
  Savemassage(String text)async{


      // final user = await FirebaseAuth.instance.currentUser;

  //print(name['name']);

    print("savemassage");
    print(UserData.username);



   // print(" data of user entered $name ");
    await massage.doc().set({'text':text,
      'name': UserData.name,
      'username':UserData.username ,
      'created':Timestamp.now() });
  }

  getmassages() async {
    print('getmassage');
    return await massage.orderBy('created',descending: true).snapshots();
  }


  Savepathimage(var path)async{

    print("saveeeeeeeeeeeeeeepost");
    await pathimage.doc(UserData.username).set(
        { 'username':UserData.username,
          'path': path.toString().substring(7,path.toString().length-1),

        }
    );
  }
  filldata()async{

    print("fill data");
    await data.doc().set(
        {         'id':4,
          'name': "Hindu Push-Ups",
          'time': "x10",
          'vedio': "assets/pinge/Pin3.mp4",
          'imagepath': "assets/backktf/im23.jpeg"
          ,'text':"Start with your hands and feet touching the floor, body bent and butt up in an upside down V shape then bend your elbows to bring your body toward the floor "



          ,'icone': "assets/backktf/icone5.png"
          ,'level': 3,
          'created':Timestamp.now()


        }
    );
  }
  //'created':Timestamp.now()
  getalldata() async {
    print('getalldata');
    return await data.orderBy('created',descending: false).snapshots();
  }

}