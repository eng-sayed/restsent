import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:rest_sent/constant.dart';
import 'package:rest_sent/screens/add_rest.dart';
import 'package:rest_sent/screens/category.dart';
import 'package:rest_sent/screens/detail_screen.dart';
import 'package:rest_sent/screens/log_in.dart';

import 'package:rest_sent/widget/drawer.dart';
import 'package:rest_sent/widget/rounded_buttom.dart';
Set newCAt = {};
class Rest extends StatefulWidget {
  static const id = 'Rest';

  @override
  _RestState createState() => _RestState();
}

class _RestState extends State<Rest> {



  CollectionReference restref = FirebaseFirestore.instance.collection('rest');
  final firestoreInstance = FirebaseFirestore.instance;






//   cat()async{
//     final QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('rest').get();
//     final int documents = qSnap.docs.length;
//
//
//     DocumentReference documentReference = restref.doc();
//     String specie;
//
//   for(int j = 0 ;j<documents; j++){
//
//     await documentReference.get().then((snapshot) {
//       // specie = snapshot.data()['cate'].toString();
//       category.add(snapshot.data()[j].data()['cate']);
//     });
//
//
//   }
//
//     print(category);
// }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
         Navigator.pushReplacementNamed(context, LogIn.id);

      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(snac('New notification'));
        });

      }
    });



    FirebaseMessaging.onMessage.listen((event) {
print('event.notification.body');
    });

  }

  String name = "";

  navigatToDetail(DocumentSnapshot post) {
    //
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  post: post,
                )));
  }



  navigatToCategory(var catName) {
    //
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Category(
              nameCategory: catName,
            )));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        title: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: TextField(
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
         //   autofocus: true,
              style: TextStyle(fontSize: 22.0, color: Colors.black),
              decoration: KTextDecoration2.copyWith(
                  fillColor: Colors.white, filled: true)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.1,
              child: StreamBuilder(
             stream:   FirebaseFirestore.instance.collection("category").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('error');
                  }
                  if (snapshot.hasData) {

                    newCAt = {};
for( int j = 0 ; j<snapshot.data.docs.length ; j++ ){



  newCAt.add(snapshot.data.docs[j].data()['Category']);
  print(newCAt);
cate= newCAt.toList();

}
                  return  ListView.builder(

                        scrollDirection: Axis.horizontal,
                        itemCount: newCAt.length,




                        itemBuilder: (context , i){

                          return RoundedButton(onPressed:  () => navigatToCategory(newCAt.elementAt(i)),
                          btnName:newCAt.elementAt(i),
                            color: Colors.white60,
                            colorText: Colors.black,
                          );
                          // return Center(
                          //   child: Container(
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left:8.0 , right: 8.0 , top: 5.0 , bottom: 5.0 ),
                          //     child: GestureDetector(
                          //       onTap: (){},
                          //       child: Text(snapshot.data.docs[i].data()['cate']),
                          //     ),
                          //   ),
                          //   ),
                          // );
                        });




                    // return GridView.builder(
                    //   itemCount: snapshot.data.docs.length,
                    //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    //     maxCrossAxisExtent: 450,
                    //     childAspectRatio: 5 / 3,
                    //   ),
                    //   itemBuilder: (context, i) {
                    //
                    //
                    //     return InkWell(
                    //       splashColor: Colors.red,
                    //       borderRadius: BorderRadius.circular(20),
                    //       child: Container(
                    //         padding: EdgeInsets.all(15),
                    //         width: double.infinity,
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.all(Radius.circular(20)),
                    //           child: GridTile(
                    //             child: Image.network(
                    //               '${snapshot.data.docs[i].data()['urlsrest']}',
                    //               fit: BoxFit.cover,
                    //             ),
                    //             footer: ClipRRect(
                    //               borderRadius: BorderRadius.only(
                    //                   bottomLeft: Radius.circular(20),
                    //                   bottomRight: Radius.circular(20)),
                    //               child: GridTileBar(
                    //
                    //                 backgroundColor: Colors.black54,
                    //                 title: Text(
                    //                   '${snapshot.data.docs[i].data()['name']}',
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: 20,
                    //                       color: Colors.white),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       // onTap: (){
                    //       //   Navigator.of(context).push(MaterialPageRoute(
                    //       //       builder: (_) {
                    //       //         return DetailsScreen();
                    //       //
                    //       //         // return DetailsScreen(documentSnapshot: snapshot.data.docs[i].data(),);
                    //       //       }));
                    //       // },
                    //
                    //       onTap: () => navigatToDetail(snapshot.data.docs[i]),
                    //     );
                    //   },
                    // );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height*.8,
              child: StreamBuilder(
              stream: (name != "" && name != null)
                  ? FirebaseFirestore.instance
                      .collection('rest')
                      .where("serch", arrayContains: name)
                      .snapshots()
                  : FirebaseFirestore.instance.collection("rest").snapshots(),
              //   stream:      (name != "" && name != null) ? (FirebaseFirestore.instance.collection('rest').where('serch' , arrayContains: name )
              //       .
              //     where('cate' ,isEqualTo: 'pub'  )
              //         .snapshots()):
              //   FirebaseFirestore.instance.collection("rest").where('cate', isEqualTo: 'pub').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('error');
                }
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data.docs.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 450,
                      childAspectRatio: 5 / 3,
                    ),
                    itemBuilder: (context, i) {


                      return InkWell(
                        splashColor: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: GridTile(
                              child: Image.network(
                                '${snapshot.data.docs[i].data()['urlsrest']}',
                                fit: BoxFit.cover,
                              ),
                              footer: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                child: GridTileBar(

                                  backgroundColor: Colors.black54,
                                  trailing: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(color: Colors.black.withOpacity(0.3),
                                      width: 100,
                                      child: Row(children: [
                                        Icon(Icons.location_on),
                                        SizedBox(width: 5,),
                                        Text(snapshot.data.docs[i].data()['city'],
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      ]),
                                    ),
                                  ),
                                  title: Text(
                                    '${snapshot.data.docs[i].data()['name']}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // onTap: (){
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (_) {
                        //         return DetailsScreen();
                        //
                        //         // return DetailsScreen(documentSnapshot: snapshot.data.docs[i].data(),);
                        //       }));
                        // },

                        onTap: () => navigatToDetail(snapshot.data.docs[i]),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
