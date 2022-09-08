class AccountModel {
  String? name;
  String? password;
  String? username;
  AccountModel({this.name, this.password, this.username});

  Map<String,dynamic>toMap(){

    Map<String,dynamic>map={
      "username":this.username,
      "password":this.password,
      "name":this.name
    };

    return map;

  }
}