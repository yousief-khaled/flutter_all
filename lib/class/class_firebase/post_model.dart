


import 'package:all_taskes/fire_base/userdata.dart';

class PostModel{
  String? postID;
  String? postContent;
  String? Username;
  String? liked;
  int? NumOfLikes;
  int? NumOfdLikes;

  PostModel({this.postID,required this.postContent, this.liked="0",this.NumOfLikes=0,required this.Username,this.NumOfdLikes=0});

  Map<String,dynamic>toMap(){

    Map<String,dynamic>x={
      "username":UserData.username,
      "content":this.postContent,
      "liked":this.liked,
      "NumOfLikes":this.NumOfLikes,
      "NumOfdLikes":this.NumOfdLikes
    };
    return x;
  }
}