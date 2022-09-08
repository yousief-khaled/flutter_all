import 'package:all_taskes/class/class_account.dart';
import 'package:all_taskes/database/data1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class showpost extends StatefulWidget {


  Account currentAccount;
  String? bu;

  List? x ;

  showpost({required this.currentAccount,required this.x});

  @override
  State<StatefulWidget> createState() {
    return ShowPostState();
  }
}

class ShowPostState extends State<showpost> {
  late String namee;
  String? bu;

  DatabaseHelp db = new DatabaseHelp();
  final urlimage =
      'https://i.pinimg.com/originals/5c/cd/75/5ccd7544f3908ca293f66e9b186015df.jpg';

  TextEditingController postController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    db.creatdatabase();
    setState(() {

    });



  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 40,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset('assets/images/face.png'),
                        Text(
                          " ${widget.currentAccount.customerName}",
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                ),
              )),
          body: Container(
            height: 900,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/yoyo.jpg'),
                  fit: BoxFit.cover,
                )),
            child: ListView.builder(
                itemCount: widget.x!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(1000, 1000, 1000, 200),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  child: ListTile(
                                    leading: Icon(Icons.account_circle_rounded),
                                    title: Text("${widget.x![index]['name']}  +>>  ${widget.x![index]['text']}"),

                                    subtitle: Row(children: [
                                      Container(
                                        height: 25,
                                        width: 60,
                                        child: ElevatedButton(
                                          onPressed: () {

                                            db.uppdatelike("1",index+1).then((value){
                                              print("row==>$value ");
                                              print("new data  ${widget.x}");
                                              print(widget.x![index]['like']);
                                              db.get_posts().then((value) {
                                                print(value);
                                                Navigator.pushReplacement(context,
                                                    MaterialPageRoute(builder: (context) {
                                                      return showpost(
                                                        currentAccount: widget.currentAccount, x: value,
                                                      );
                                                    }));
                                              });


                                            });

                                            db.creatdatabase();


                                          },
                                          child:widget.x![index]['like']=="1"? Icon(Icons.thumb_up_alt)
                                              :Icon(Icons.thumb_up_alt_outlined),

                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Container(
                                          height: 25,
                                          width: 60,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  db.uppdatelike("2",index+1).then((value){
                                                    print("row==>$value ");
                                                    print("new data  ${widget.x}");
                                                    print(widget.x![index]['like']);
                                                  });
                                                  db.get_posts().then((value) {
                                                    print(value);
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) {
                                                          return showpost(
                                                            currentAccount: Account(id:widget.currentAccount.id ,
                                                                customerName: widget.currentAccount.customerName,
                                                                email:widget.currentAccount.email ,
                                                                Password: widget.currentAccount.Password), x: value,
                                                          );
                                                        }));
                                                  });

                                                });
                                                db.creatdatabase();

                                              },
                                              child:widget.x![index]['like']=="2"? Icon(Icons.thumb_down_alt):Icon(Icons.thumb_down_alt_outlined)
                                          ),
                                        ),
                                      )
                                    ]),
                                    trailing: Icon(Icons.food_bank),
                                  ),
                                )),
                          )));
                }),
          ),
        ));
  }
}
