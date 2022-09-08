
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelp {
  late Database db;
  Future<Database?>creatdatabase() async {
    db = await openDatabase('yoyo175.db', version: 1,
        onCreate: (database, version) {
          print('craeted date');
          database
              .execute(
              'create table tasks (id integer primary key autoincrement,name varchar(50),username varchar(50),password varchar(50))')
              .then((value) {


            print("created tabel");
          }).catchError((eror) {
            print("eror ${eror.toString()}");
          });
          database
              .execute(

              'create table post (indexx integer primary key autoincrement,text varchar(50),like varchar(50),name varchar(50))')
              .then((value) {


            print("created tabel");
          }).catchError((eror) {
            print("erorooo ${eror.toString()}");
          });



        }, onOpen: (database) {
          print('open data');
        });
    return db;
  }

  Future<int> insertdatabase(String name,String username,String password,) async {

    Database? db2 = await creatdatabase();
    print("inserted ");


    return db2!.insert('tasks', {
      'name': name,
      'username': username,
      'password': password,

    });

  }
  Future<int> insert() async {
    Database? db2 = await creatdatabase();


    print("inserted bbbbbbbbbbb ");


    return db.insert('tasks', {
      'username': 'ahmed',
      'password': '1234',

    });
  }

  Future<List> get_account(String username,String password)async{

    Database? db =await creatdatabase();
    print('>>in<<');
    return db!.query('tasks', where: 'username = ? and password = ?', whereArgs: [username, password]);
  }

  Future<void> deletdatabase() async {

    db.delete('tasks');
    print("fff");
  }
  Future<List> show_posts(int index)async{

    Database? db =await creatdatabase();
    print('>>in<<');
    return db!.query('post', where: 'index = ? ', whereArgs: [index]);
  }

  Future<int> addpost(String text,String name) async {
    Database? db2 = await creatdatabase();


    print(" add post ");


    return db.insert('post', {
      'text': text,
      'like':'0',
      'name':name,


    });
  }
  Future<List> get_posts()async{

    Database? db =await creatdatabase();
    print('>>in<<');
    return db!.rawQuery('select * from post');
  }


  Future<int> uppdatelike(String like,int indexxx) async {
    Database? db2 = await creatdatabase();


    print(" add post ");


    return db.update('post',
      {
        'like':like
      },
      where: 'indexx = ?',
      whereArgs: [indexxx.toString()],
    );
  }

}
