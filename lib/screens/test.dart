// // // // // import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter/cupertino.dart';
// // // // // import 'package:firebase_core/firebase_core.dart';
// // // // //
// // // // //
// // // // // class MyHome extends StatefulWidget {
// // // // //   static const id = 'Myhome';
// // // // //
// // // // //   @override
// // // // //   _MyHomeState createState() => new _MyHomeState();
// // // // // }
// // // // //
// // // // // class _MyHomeState extends State<MyHome> {
// // // // //   List<UploadJob> _profilePictures = [];
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final profilePictureTile = new Material(
// // // // //       color: Colors.transparent,
// // // // //       child: new Column(
// // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // //         children: <Widget>[
// // // // //           const Text('Profile Picture',
// // // // //               style: TextStyle(
// // // // //                 color: CupertinoColors.systemBlue,
// // // // //                 fontSize: 15.0,
// // // // //               )),
// // // // //           const Padding(
// // // // //             padding: EdgeInsets.only(bottom: 5.0),
// // // // //           ),
// // // // //           PictureUploadWidget(
// // // // //             initialImages: _profilePictures,
// // // // //             onPicturesChange: profilePictureCallback,
// // // // //             buttonStyle: PictureUploadButtonStyle(),
// // // // //             buttonText: 'Upload Picture',
// // // // //             localization: PictureUploadLocalization(),
// // // // //             settings: PictureUploadSettings(
// // // // //               // customDeleteFunction: ProfileController.deleteProfilePicture,
// // // // //               // customUploadFunction: RecipeController.uploadRecipePicture,
// // // // //                 imageSource: ImageSourceExtended.askUser,
// // // // //                 minImageCount: 0,
// // // // //                 maxImageCount: 5,
// // // // //                 imageManipulationSettings: const ImageManipulationSettings(
// // // // //                     enableCropping: true, compressQuality: 75)),
// // // // //             enabled: true,
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //
// // // // //     return new Scaffold(
// // // // //       body: Padding(
// // // // //           padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
// // // // //           child: Column(children: <Widget>[profilePictureTile])),
// // // // //     );
// // // // //   }
// // // // //
// // // // //   void profilePictureCallback(
// // // // //       {List<UploadJob> uploadJobs, bool pictureUploadProcessing}) {
// // // // //     _profilePictures = uploadJobs;
// // // // //   }
// // // // // }
// // // // //
// // // // //
// // // // //
// // // // //
// // // // //
// //
// // //
// // // import 'package:carousel_pro/carousel_pro.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:rest_sent/constant.dart';
// // //
// // // class ViewImages extends StatelessWidget {
// // //   List<NetworkImage> _listOfImages = <NetworkImage>[];
// // //   static const id = 'View';
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       children: <Widget>[
// // //         SizedBox(
// // //           height: 20,
// // //         ),
// // //         Flexible(
// // //             child: StreamBuilder<QuerySnapshot>(
// // //                 stream: FirebaseFirestore.instance.collection().snapshots(),
// // //                 builder: (context, snapshot) {
// // //                   if (snapshot.hasData) {
// // //                     return ListView.builder(
// // //                         itemCount: snapshot.data.docs.length,
// // //                         itemBuilder: (BuildContext context, int index) {
// // //                           _listOfImages = [];
// // //                           for (int i = 0;
// // //                           i <
// // //                               snapshot.data.docs[index].data()['urls']
// // //                                   .length;
// // //                           i++) {
// // //                             _listOfImages.add(NetworkImage(snapshot
// // //                                 .data.docs[index].data()['urls'][i]));
// // //                           }
// // //                           return Column(
// // //                             children: <Widget>[
// // //                               Container(
// // //                                 margin: EdgeInsets.all(10.0),
// // //                                 height: 200,
// // //                                 decoration: BoxDecoration(
// // //                                   color: Colors.white,
// // //                                 ),
// // //                                 width: MediaQuery.of(context).size.width,
// // //                                 child: Carousel(
// // //                                     boxFit: BoxFit.cover,
// // //                                     images: _listOfImages,
// // //                                     autoplay: false,
// // //                                     indicatorBgPadding: 5.0,
// // //                                     dotPosition: DotPosition.bottomCenter,
// // //                                     animationCurve: Curves.fastOutSlowIn,
// // //                                     animationDuration:
// // //                                     Duration(milliseconds: 2000)),
// // //                               ),
// // //                               Container(
// // //                                 height: 1,
// // //                                 width: MediaQuery.of(context).size.width,
// // //                                 color: Colors.red,
// // //                               )
// // //                             ],
// // //                           );
// // //                         });
// // //                   } else {
// // //                     return Center(
// // //                       child: CircularProgressIndicator(),
// // //                     );
// // //                   }
// // //                 }))
// // //       ],
// // //     );
// // //   }
// // // }
// // // //
// // // //
// // // // import 'package:carousel_pro/carousel_pro.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:rest_sent/screens/view_image.dart';
// // // // class ShowingData extends StatefulWidget {
// // // //
// // // //   static const id = 'ShowingData';
// // // //
// // // //
// // // //   @override
// // // //   _ShowingDataState createState() => _ShowingDataState();
// // // // }
// // // //
// // // // class _ShowingDataState extends State<ShowingData> {
// // // //   List<NetworkImage> listOfImagess = ViewImages().listOfImages;
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Column(
// // // //         children: <Widget>[
// // // //           SizedBox(
// // // //             height: 20,
// // // //           ),
// // // //           Flexible(
// // // //               child: StreamBuilder<QuerySnapshot>(
// // // //                   stream: FirebaseFirestore.instance.collection('ahmed').snapshots(),
// // // //                   //.collection('sayed1')
// // // //                   builder: (context, snapshot) {
// // // //                     if (snapshot.hasData) {
// // // //                       return ListView.builder(
// // // //                           itemCount: snapshot.data.docs.length,
// // // //                           itemBuilder: (BuildContext context, int index) {
// // // //                             listOfImagess = [];
// // // //                             for (int i = 0;
// // // //                             i <
// // // //                                 snapshot.data.docs[index].data()['urls']
// // // //                                     .length;
// // // //                             i++) {
// // // //                               listOfImagess.add(NetworkImage(snapshot
// // // //                                   .data.docs[index].data()['urls'][i]));
// // // //                             }
// // // //                             return Column(
// // // //                               children: <Widget>[
// // // //                                 GestureDetector(onTap:(){},
// // // //                                   child: Container(
// // // //                                     margin: EdgeInsets.all(10.0),
// // // //                                     height: 300,
// // // //                                     decoration: BoxDecoration(
// // // //                                       color: Colors.white,
// // // //                                     ),
// // // //                                     width: MediaQuery.of(context).size.width,
// // // //                                     child: Carousel(
// // // //                                         boxFit: BoxFit.cover,
// // // //                                         images: listOfImagess,
// // // //                                         autoplay: false,
// // // //                                         indicatorBgPadding: 5.0,
// // // //                                         dotPosition: DotPosition.bottomCenter,
// // // //                                         animationCurve: Curves.fastOutSlowIn,
// // // //                                         animationDuration:
// // // //                                         Duration(milliseconds: 2000)),
// // // //                                   ),
// // // //                                 ),
// // // //                                 Container(
// // // //                                   height: 1,
// // // //                                   width: MediaQuery.of(context).size.width,
// // // //                                   color: Colors.red,
// // // //                                 )
// // // //                               ],
// // // //                             );
// // // //                           });
// // // //                     } else {
// // // //                       return Center(
// // // //                         child: CircularProgressIndicator(),
// // // //                       );
// // // //                     }
// // // //                   }))
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // void main() {
// // //   runApp(SimpleCustumizedDialogRun());
// // // }
// // //
// // // class SimpleCustumizedDialogRun extends StatelessWidget{
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp (
// // //       debugShowCheckedModeBanner: false,
// // //       title: "CustomizedDialog",
// // //       home: new Scaffold(
// // //         appBar: AppBar(
// // //           title:Text("Customized Dialog"),
// // //         ),
// // //         body:
// // //         Center(
// // //           child:
// // //
// // //           RaisedButton(
// // //             child:
// // //             Text('Click Me'),
// // //             onPressed: () {
// // //
// // //               // var alert = AlertDialog(
// // //               //     title:Text("Dialog Title",),
// // //               //     content:
// // //               //     Container(
// // //               //       height: 180,
// // //               //       child: Column(
// // //               //         children: <Widget>[
// // //               //           Divider(color: Colors.black,),
// // //               //           Text(
// // //               //             "Dialog Text Appear Here You Can type AnyThing You Want!",
// // //               //           ),
// // //               //           SizedBox(height: 7,),
// // //               //           SizedBox(
// // //               //             width: double.infinity,
// // //               //             child:
// // //               //             RaisedButton(
// // //               //               color: Colors.red,
// // //               //               shape: RoundedRectangleBorder(
// // //               //                 borderRadius: BorderRadius.circular(30.0),
// // //               //               ),
// // //               //               onPressed: (){
// // //               //                 Navigator.of(context,rootNavigator: true).pop('dialog');
// // //               //               },
// // //               //               child: Text(
// // //               //                 "Close",
// // //               //                 textAlign: TextAlign.center,
// // //               //               ),
// // //               //             ),
// // //               //           ),
// // //               //         ],
// // //               //       ),
// // //               //     )
// // //               // );
// // //               //
// // //               // showDialog(
// // //               //     context: context,
// // //               //     builder: (BuildContext context) {
// // //               //       return alert;
// // //               //     });
// // //
// // //
// // //
// // //             },
// // //           ),
// // //         ),
// // //
// // //       ),
// // //     );
// // //   }
// // //
// // // }
// // //
// // //
// // // },
// // // ),
// // // ),
// // //
// // //
// // //
// // //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // //
// // // Container(
// // // // height: double.infinity,
// // // // color:  Colors.black,
// // // child: Padding(
// // //
// // // padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 30),
// // // child: SingleChildScrollView(
// // //
// // // child:Column(
// // //
// // // children: [
// // //
// // // SizedBox(
// // // height: 20,
// // // ),
// // // Container(
// // //
// // // child: TextField(
// // // decoration: KTextDecoration.copyWith(hintText: 'Enter Restaurant Name',prefixIcon: Icon(Icons.restaurant , color: Colors.black,), ),
// // //
// // // keyboardType: TextInputType.text,
// // // textAlign: TextAlign.center,
// // //
// // // ),
// // // ),
// // // SizedBox(height: 5),
// // // Container(
// // // child: TextField(
// // // decoration: KTextDecoration.copyWith(hintText: 'Enter Number',prefixIcon: Icon(Icons.phone_android , color: Colors.black,), ),
// // //
// // // keyboardType:TextInputType.number,
// // // textAlign: TextAlign.center,
// // // ),
// // // ),
// // // SizedBox(height: 5),
// // // Container(
// // // child: TextField(
// // // decoration: KTextDecoration.copyWith(hintText: 'Enter Number',prefixIcon: Icon(Icons.phone_android , color: Colors.black,), ),
// // //
// // // keyboardType:TextInputType.number,
// // // textAlign: TextAlign.center,
// // // ),
// // // ),
// // // SizedBox(height: 5),
// // // Container(
// // // child: TextField(
// // // decoration: KTextDecoration.copyWith(hintText: 'Enter Number',prefixIcon: Icon(Icons.phone_android , color: Colors.black,), ),
// // //
// // // keyboardType:TextInputType.number,
// // // textAlign: TextAlign.center,
// // // ),
// // // ),
// // // SizedBox(height: 5),
// // // Container(
// // // child: TextField(
// // // decoration: KTextDecoration.copyWith(hintText: 'Enter Number',prefixIcon: Icon(Icons.phone_android , color: Colors.black,), ),
// // //
// // // keyboardType:TextInputType.number,
// // // textAlign: TextAlign.center,
// // // ),
// // // ),
// // //
// // // SizedBox(height: 40),
// // //
// // //
// // // Container(
// // //
// // //
// // // color: Colors.white24,
// // // child: Row(
// // // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // children: [
// // // FlatButton(
// // // shape: RoundedRectangleBorder(
// // // side: BorderSide(color: Colors.black38),
// // // borderRadius: BorderRadius.all(Radius.circular(20)),
// // // ),
// // // onPressed: () {
// // // setState(() {
// // // a = Colors.white38;
// // // });
// // // },
// // // color: Colors.black38,
// // // child: Text('Pick Rest'),
// // // textColor: Colors.black,
// // // splashColor: Colors.blueGrey,
// // // ),
// // //
// // // FlatButton(
// // // //highlightColor: Colors.black38,
// // //
// // // shape: RoundedRectangleBorder(
// // // side: BorderSide(color: Colors.black38),
// // // borderRadius: BorderRadius.all(Radius.circular(20)),
// // // ),
// // // onPressed: (){
// // // setState(() {
// // // a = Colors.blueGrey;
// // // });
// // // },
// // //
// // // splashColor: Colors.blueGrey,
// // // color: Colors.black38,
// // // child: Text('Pick Menu'),
// // // textColor: Colors.black,
// // // ),
// // //
// // // ],
// // // ),
// // // ),
// // // FlatButton(
// // //
// // //
// // // shape: RoundedRectangleBorder(
// // // side: BorderSide(color: Colors.black38),
// // // borderRadius: BorderRadius.all(Radius.circular(20)),
// // // ),
// // // onPressed: () {
// // // setState(() {
// // // a = Colors.grey;
// // //
// // // });
// // //
// // // },
// // // splashColor: Colors.blueGrey,
// // // color: Colors.black38,
// // // child: Text('Send'),
// // // textColor: Colors.black,
// // // ),
// // // Expanded(
// // // child: buildGridView(), // مطعم
// // // ),
// // // Expanded(
// // // child: buildGridView1(), // منيو
// // // ),
// // // ],
// // //
// // // ),
// // // ),
// // //
// // // ),
// // // ),
// // //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // //
// // // Widget buildResultCard(data) {
// // //   return GestureDetector(
// // //     onTap: (){
// // //       Navigator.of(context).push(
// // //           MaterialPageRoute(builder: (context) => MyPage(data: data));
// // //       );
// // //     },
// // //     child: Card(
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
// // //         elevation: 2.0,
// // //         child: Container(
// // //             child: Center(
// // //                 child: Text(data['businessName'],
// // //                   textAlign: TextAlign.center,
// // //                   style: TextStyle(
// // //                     color: Colors.black,
// // //                     fontSize: 20.0,
// // //                   ),
// // //                 )
// // //             )
// // //         )
// // //     ),
// // //   );
// // // }
// // //
// // //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:rest_sent/constant.dart';
// // // class MyApp extends StatefulWidget {
// // //   @override
// // //   _MyAppState createState() => _MyAppState();
// // // }
// // //
// // // class _MyAppState extends State<MyApp> {
// // //   var a = Colors.black38;
// // //   var b = Colors.black;
// // //   var c = Colors.white38;
// // //
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         backgroundColor: Colors.white,
// // //         appBar: AppBar(
// // //           backgroundColor: Colors.teal,
// // //           leading: Icon(Icons.access_time),
// // //           actions: <Widget>[
// // //             IconButton(
// // //               icon: Icon(
// // //                 Icons.menu,
// // //                 color: Colors.white,
// // //               ),
// // //               onPressed: () {
// // //                 // do something
// // //               },
// // //             )
// // //           ],
// // //         ),
// // //         body: Container(
// // //
// // //           child: Padding(
// // //
// // //             padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 30),
// // //             child: SingleChildScrollView(
// // //
// // //               child:Column(
// // //
// // //                 children: [
// // //
// // //                   SizedBox(
// // //                     height: 20,
// // //                   ),
// // //                   Container(
// // //
// // //                     child: TextField(
// // //                       decoration: KTextDecoration.copyWith(hintText: 'Enter Restaurant Name',prefixIcon: Icon(Icons.restaurant , color: Colors.blueGrey,) ),
// // //
// // //                       keyboardType: TextInputType.text,
// // //                       textAlign: TextAlign.center,
// // //                       cursorColor: Colors.black,
// // //
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 5),
// // //                   Container(
// // //                     child: TextField(
// // //                       decoration: KTextDecoration.copyWith(hintText: 'Enter Number',prefixIcon: Icon(Icons.phone_android , color: Colors.blueGrey,), ),
// // //
// // //                       keyboardType:TextInputType.number,
// // //                       textAlign: TextAlign.center,
// // //                       cursorColor: Colors.black,
// // //
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 5),
// // //                   Container(
// // //                     child: TextField(
// // //                       decoration: KTextDecoration.copyWith(hintText: 'Enter Number',prefixIcon: Icon(Icons.phone_android , color: Colors.blueGrey,), ),
// // //
// // //                       keyboardType:TextInputType.number,
// // //                       textAlign: TextAlign.center,
// // //                       cursorColor: Colors.black,
// // //
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 5),
// // //                   Container(
// // //                     child: TextField(
// // //                       decoration: KTextDecoration.copyWith(hintText: 'Enter Number',prefixIcon: Icon(Icons.phone_android , color: Colors.blueGrey,), ),
// // //
// // //                       keyboardType:TextInputType.number,
// // //                       textAlign: TextAlign.center,
// // //                       cursorColor: Colors.black,
// // //
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 5),
// // //                   Container(
// // //                     child: TextField(
// // //                       decoration: KTextDecoration.copyWith(hintText: 'Enter Number',prefixIcon: Icon(Icons.phone_android , color: Colors.blueGrey,), ),
// // //
// // //                       keyboardType:TextInputType.number,
// // //                       textAlign: TextAlign.center,
// // //                       cursorColor: Colors.black,
// // //
// // //                     ),
// // //                   ),
// // //
// // //                   SizedBox(height: 40),
// // //
// // //
// // //                   Container(
// // //
// // //
// // //                     //color: Colors.white24,
// // //                     child: Row(
// // //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                       children: [
// // //                         FlatButton(
// // //                           shape: RoundedRectangleBorder(
// // //                             side: BorderSide(color: Colors.blueGrey),
// // //                             borderRadius: BorderRadius.all(Radius.circular(20)),
// // //                           ),
// // //                           onPressed: () {
// // //                             setState(() {
// // //
// // //                             });
// // //                           },
// // //                           color: Colors.teal,
// // //                           child: Text('Pick Rest'),
// // //                           textColor: Colors.white,
// // //                           splashColor: Colors.blueGrey[50],
// // //                         ),
// // //
// // //                         FlatButton(
// // //                           //highlightColor: Colors.black38,
// // //
// // //                           shape: RoundedRectangleBorder(
// // //                             side: BorderSide(color: Colors.blueGrey),
// // //                             borderRadius: BorderRadius.all(Radius.circular(20)),
// // //                           ),
// // //                           onPressed: (){
// // //                             setState(() {
// // //
// // //                             });
// // //                           },
// // //
// // //                           splashColor: Colors.blueGrey[50],
// // //                           color: Colors.teal,
// // //                           child: Text('Pick Menu'),
// // //                           textColor: Colors.white,
// // //                         ),
// // //
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   FlatButton(
// // //
// // //
// // //                     shape: RoundedRectangleBorder(
// // //                       side: BorderSide(color: Colors.blueGrey),
// // //                       borderRadius: BorderRadius.all(Radius.circular(20)),
// // //                     ),
// // //                     onPressed: () {
// // //                       setState(() {
// // //
// // //
// // //                       });
// // //
// // //                     },
// // //                     splashColor: Colors.blueGrey[50],
// // //                     color: Colors.teal,
// // //                     child: Text('Send'),
// // //                     textColor: Colors.white,
// // //                   ),
// // //
// // //                 ],
// // //
// // //               ),
// // //             ),
// // //
// // //           ),
// // //         ),
// // //
// // //
// // //       ),
// // //
// // //     );
// // //   }
// // // }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// //
// // class CloudFirestoreSearch extends StatefulWidget {
// //   @override
// //   _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
// // }
// //
// // class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
// //   String name = "";
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_ios),
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //         ),
// //         title: Theme(
// //           data: Theme.of(context).copyWith(splashColor: Colors.transparent),
// //
// //           child: TextField(
// //             autofocus: false,
// //
// //             decoration: InputDecoration(
// //                 prefixIcon: Icon(Icons.search), hintText: 'Search...'),
// //             onChanged: (val) {
// //               setState(() {
// //                 name = val;
// //               });
// //             },
// //           ),
// //         ),
// //       ),
// //       body: StreamBuilder<QuerySnapshot>(
// //         stream: (name != "" && name != null)
// //             ? FirebaseFirestore.instance
// //             .collection('rest')
// //             .where("serch", arrayContains: name)
// //             .snapshots()
// //             : FirebaseFirestore.instance.collection("rest").snapshots(),
// //         builder: (context, snapshot) {
// //           return (snapshot.connectionState == ConnectionState.waiting)
// //               ? Center(child: CircularProgressIndicator())
// //               : ListView.builder(
// //             itemCount: snapshot.data.docs.length,
// //             itemBuilder: (context, index) {
// //               DocumentSnapshot data = snapshot.data.docs[index];
// //               return Card(
// //                 child: Row(
// //                   children: <Widget>[
// //                     Image.network(
// //                       data['urlsrest'],
// //                       width: 150,
// //                       height: 100,
// //                       fit: BoxFit.fill,
// //                     ),
// //                     SizedBox(
// //                       width: 25,
// //                     ),
// //                     Text(
// //                       data['name'],
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.w700,
// //                         fontSize: 20,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:full_screen_image/full_screen_image.dart';
//
//
//
// class CloudFirestoreSearch extends StatelessWidget {
//   String lorem =
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consequat mauris in ex facilisis feugiat. Donec vestibulum elit id feugiat ultrices. Aenean ultrices rhoncus velit at viverra. In pharetra, nibh egestas mattis pretium, ipsum sapien rhoncus leo, consequat commodo erat elit ac nisi. Nulla elit justo, pretium sit amet quam eu, congue aliquam tellus. Integer eget luctus ante, pulvinar efficitur metus. Nam ut sodales urna, id placerat dolor. Nunc in feugiat turpis. In dictum leo dapibus justo semper, at facilisis lacus commodo. Nam porttitor et eros ut pharetra. Nullam ut quam eu felis ullamcorper elementum at et arcu. Phasellus nec massa risus. Praesent viverra pharetra ante. Etiam elementum ultricies nisl ultricies tempus. Pellentesque consequat feugiat ipsum, at venenatis nulla tincidunt eget. Nunc lobortis pretium nulla. Aenean condimentum felis a dignissim ultricies. Maecenas bibendum scelerisque rhoncus. Vestibulum sed ante sit amet elit luctus molestie. Curabitur consequat dolor magna, vitae pulvinar metus ultrices at. Maecenas sit amet pretium nibh. Ut vulputate nisl lorem, sed fringilla elit facilisis ut. Ut ac tincidunt tortor. Pellentesque leo ex, efficitur eget neque non, maximus molestie quam. Duis sagittis at ipsum non sagittis. Sed convallis, lorem a sagittis eleifend, nisl turpis efficitur massa, nec ultrices diam purus non leo. Pellentesque tempor in sem quis lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris lacinia, elit a maximus fermentum, lacus felis venenatis elit, ut fringilla sem justo quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam ornare tincidunt lectus sit amet euismod. Nunc sodales velit quis leo luctus ultrices. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer molestie, felis eget ornare consequat, elit dolor ullamcorper leo, et feugiat felis eros sit amet nisl. Vestibulum et egestas felis, ac sodales ante. In in volutpat justo.Vestibulum volutpat dapibus felis. Proin in dolor purus. Mauris varius vitae nulla quis sodales. Duis sapien sapien, maximus sed lacinia quis, elementum in arcu. Etiam hendrerit convallis nulla efficitur consequat. Suspendisse mattis lacinia erat, eget congue ligula molestie at. Aenean blandit nisl eget arcu sodales pellentesque. Aenean ullamcorper neque vel eleifend dignissim. Phasellus nec feugiat mi. Ut dictum diam quis nulla suscipit, eu venenatis eros faucibus.Aenean aliquet purus nec orci facilisis congue. Aliquam gravida sem non ipsum venenatis, sit amet volutpat mi placerat. In vitae risus quis sem ullamcorper vestibulum. Maecenas bibendum tellus at libero congue consequat. Nulla quam elit, placerat at egestas vel, ultrices in erat. Donec non rhoncus nulla, nec consectetur magna. Aenean luctus dolor mi, nec sodales ipsum hendrerit et. Aliquam volutpat risus in pulvinar fringilla. Etiam tellus erat, malesuada ac pharetra non, egestas non sapien. Curabitur malesuada aliquet rhoncus. Aenean semper, magna nec malesuada feugiat, lorem odio vestibulum mauris, sed interdum nisl tortor sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus tempor metus mi, quis volutpat elit auctor non. Quisque tellus diam, aliquam eget blandit quis, sagittis sit amet erat. Mauris lobortis nunc a neque consequat efficitur.In hac habitasse platea dictumst. Aenean varius risus eu pulvinar interdum. Pellentesque imperdiet tortor urna, pharetra lacinia eros luctus ac. Nunc vitae luctus eros. Mauris eu vestibulum metus, iaculis rhoncus mi. Nulla imperdiet finibus sagittis. Proin vel pellentesque urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. In dignissim ultricies massa sed pharetra. Nunc libero massa, scelerisque ac orci vel, finibus aliquet urna. Maecenas eget lorem at dui sodales feugiat eget et nibh. Phasellus feugiat, lectus in facilisis dapibus, odio nisi maximus quam, eu facilisis turpis lorem vel diam. Morbi auctor consequat leo, sed venenatis lacus. Nunc vel nisl diam.Vivamus augue odio, varius nec lacinia in, placerat sed arcu. Integer sollicitudin nisl ut tempor malesuada. Suspendisse nunc dui, molestie pulvinar pretium vitae, accumsan a nulla. Aliquam erat volutpat. Ut dictum malesuada vestibulum. Quisque commodo ex id diam maximus, fermentum egestas neque euismod. Donec molestie augue elit, eget vulputate justo pellentesque ut. Mauris sed pulvinar erat, eu molestie dolor. Integer nec eleifend lacus. Suspendisse lobortis, eros id mattis sagittis, tortor libero feugiat est, et tristique arcu tortor lacinia quam. Etiam posuere elit nibh, non maximus turpis cursus sed. Proin rhoncus purus ex, vitae interdum purus aliquam porttitor. Cras dignissim et enim nec convallis.Duis non metus in magna elementum elementum. Proin vitae commodo dui. Pellentesque ultricies, lectus nec suscipit ornare, enim neque pellentesque sapien, quis varius mauris magna pretium odio. Sed quis purus eu lorem dignissim mollis. Nullam mattis quam nunc, quis accumsan turpis scelerisque ac. Proin pharetra tempor lorem, et pretium diam lacinia sed. Sed in turpis tristique, imperdiet elit in, rutrum ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus augue diam, euismod quis placerat imperdiet, hendrerit vitae tortor. In non sapien vitae ante fermentum consectetur.Integer elementum ligula erat, id sodales dui convallis vel. Pellentesque elementum quam tellus, vitae sodales metus ultrices ac. Aenean at nibh lectus. Pellentesque tempus imperdiet sollicitudin. Fusce porttitor mauris sed euismod aliquet. Aenean sed nibh tortor. Etiam pretium mauris sed ultricies tincidunt. Mauris imperdiet sem orci, et euismod ligula laoreet non. Suspendisse ut ex leo. Sed pellentesque libero non facilisis porta.";
//
//   Widget fullScreenImage() => FullScreenWidget(
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child: Image.asset(
//         "assets/image1.jpg",
//         fit: BoxFit.cover,
//       ),
//     ),
//   );
//
//   Widget fullScreenHeroWidget() => FullScreenWidget(
//     child: Hero(
//       tag: "customTag",
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Image.asset(
//           "assets/image2.jpg",
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//   );
//
//   //if you don't want widget full screen then use center widget
//   Widget smallImage() => FullScreenWidget(
//     child: Center(
//       child: Hero(
//         tag: "smallImage",
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Image.asset(
//             "assets/image3.jpg",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     ),
//   );
//
//   Widget customBackgroundColor() => FullScreenWidget(
//     backgroundColor: Colors.purple,
//     child: Center(
//       child: Hero(
//         tag: "customBackground",
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Image.asset(
//             "assets/image3.jpg",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     ),
//   );
//
//   Widget nonTransparentWidget() => FullScreenWidget(
//     backgroundColor: Colors.purple,
//     backgroundIsTransparent: false,
//     child: Center(
//       child: Hero(
//         tag: "nonTransparent",
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Image.asset(
//             "assets/image3.jpg",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     ),
//   );
//
//   Widget customWidget() => FullScreenWidget(
//     child: SafeArea(
//       child: Card(
//         elevation: 4,
//         child: Container(
//           height: 350,
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               Hero(
//                 tag: "customWidget",
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: Image.asset(
//                     "assets/image3.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Text(
//                 'Lorem text',
//                 style: TextStyle(
//                     color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Expanded(
//                 child: Text(
//                   lorem,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Full screen widget example'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               GridView.count(
//                 primary: false,
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: fullScreenImage(),
//                       ),
//                       ListTile(
//                         title: Text(
//                           'Full screen image',
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: fullScreenHeroWidget(),
//                       ),
//                       ListTile(
//                         title: Text(
//                           'Full screen image with hero',
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: smallImage(),
//                       ),
//                       ListTile(
//                         title: Text(
//                           'Small image with hero',
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: customBackgroundColor(),
//                       ),
//                       ListTile(
//                         title: Text(
//                           'Custom background',
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: nonTransparentWidget(),
//                       ),
//                       ListTile(
//                         title: Text(
//                           'None transparent',
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: customWidget(),
//                   ),
//                   ListTile(
//                     title: Text(
//                       'Custom Widget',
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget image_carousel = new Container(
//     height: 345.0,
//     child: CarouselSlider(
//       height: 400.0,
//       items: _listOfImages.map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: BoxDecoration(color: Colors.amber),
//                 child: GestureDetector(
//                     child: Image.network(i, fit: BoxFit.fill),
//                     onTap: () {
//                       Navigator.push<Widget>(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ImageScreen(i),
//                         ),
//                       );
//                     }));
//           },
//         );
//       }).toList(),
//     ));

// import 'package:flutter/material.dart';
//
// class ImageScreen extends StatefulWidget {
//   final String url;
//   ImageScreen(this.url);
//
//   @override
//   _MyImageScreen createState() => _MyImageScreen(url);
// }
//
// class _MyImageScreen extends State<ImageScreen> {
//   final String url;
//   _MyImageScreen(this.url);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('ImageScreen'),
//         ),
//         body: Image.network(url, width: double.infinity));
//   }
// }

//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';
//
//
// class DetailsScreen extends StatefulWidget {
//   final DocumentSnapshot post;
//   DetailsScreen({this.post});
//   @override
//   _DetailsScreenState createState() => _DetailsScreenState();
// }
//
// class _DetailsScreenState extends State<DetailsScreen> {
//   int i = 0;
//   List<NetworkImage> _listOfImages = <NetworkImage>[];
//
//   loop() {
//     for (i = 0; i <= widget.post.data()['urlsMenu'].length; i++) {
//       print(i);
//       return Image.network(widget.post.data()['urlsMenu'][i],fit: BoxFit.cover,);
//     }
//   }
//
//   List num = [];
//
//   loopnum() {
//     setState(() {
//       for (int g = 0; g < widget.post.data()['nums'].length; g++) {
//         num.add(widget.post.data()['nums'][g]);
//       }
//     });
//     return num;
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     loop();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _listOfImages = [];
//     for (int i = 0; i < widget.post.data()['urlsMenu'].length; i++) {
//       _listOfImages.add(NetworkImage(widget.post.data()['urlsMenu'][i]));
//     }
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFFD32F2F),
// actions: [
//   DropdownButton(icon: Icon(Icons.call),
//     onTap: (){
//       return Container(
//         height: 250,
//         width: 250,
//         child: Column(
//           children: [
//             FlatButton(
//               child: Text(widget.post.data()['nums'][0],
//                 style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
//               onPressed: () async {
//                 FlutterPhoneDirectCaller.callNumber(loopnum()[0].toString());},
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: FlatButton(
//                 child: Text(widget.post.data()['nums'][1],
//                   style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
//                 onPressed: () async {
//                   FlutterPhoneDirectCaller.callNumber(loopnum()[1].toString());},
//               ),),
//
//             Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: FlatButton(
//                 child: Text(widget.post.data()['nums'][2],
//                   style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
//                 onPressed: () async {
//                   FlutterPhoneDirectCaller.callNumber(loopnum()[2].toString());},
//               ),),
//
//             Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: FlatButton(
//                 child: Text(widget.post.data()['nums'][3].toString(),
//                   style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
//                 onPressed: () async {
//                   FlutterPhoneDirectCaller.callNumber(loopnum()[3].toString());},
//               ),
//             ),
//
//           ],
//         ),
//       );
//     },
//   )
//],
//           title: Text(widget.post.data()['name']),
//           centerTitle: true,
//         ),
//         body: ListView(
//             children: [
//               Container(
//                 height: 400,
//                 width: double.infinity,
//                 child: GestureDetector(
//                   child: PhotoViewGallery.builder(
//                     scrollPhysics: const BouncingScrollPhysics(),
//                     itemCount: _listOfImages.length,
//                     builder: (BuildContext context, int index){
//                       return PhotoViewGalleryPageOptions(
//                         imageProvider: NetworkImage(widget.post.data()['urlsMenu'][index]),
//                         initialScale: PhotoViewComputedScale.contained*0.8,
//                         heroAttributes: PhotoViewHeroAttributes(tag: _listOfImages[index]),
//                       );
//
//                     },
//
//                     loadingBuilder: (context , event){
//                       return Center(
//                         child: Container(
//                           width: 20,
//                           height: 20,
//                           child: CircularProgressIndicator(
//                             value: event == null ?0 : event.cumulativeBytesLoaded / event.expectedTotalBytes,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   onTap: (){
//                     Navigator.of(context).push(MaterialPageRoute(builder: (_){
//                       return MenuImageView(bost: widget.post);
//                     }));
//                   },
//                 ),
//               ),
//             ] ));
//   }
// }
//
// class MenuImageView extends StatefulWidget {
//   final DocumentSnapshot bost;
//   MenuImageView({this.bost});
//   @override
//   _MenuImageView createState() => _MenuImageView();
// }
//
// class _MenuImageView extends State<MenuImageView> {
//   int i = 0;
//   List<NetworkImage> _listOfImages = <NetworkImage>[];
//
//   loop() {
//     for (i = 0; i <= widget.bost.data()['urlsMenu'].length; i++) {
//       print(i);
//       return Image.network(widget.bost.data()['urlsMenu'][i],fit: BoxFit.cover,);
//     }
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     loop();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _listOfImages = [];
//     for (int i = 0; i < widget.bost.data()['urlsMenu'].length; i++) {
//       _listOfImages.add(NetworkImage(widget.bost.data()['urlsMenu'][i]));
//     }
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: Text(widget.bost.data()['name']),
//           centerTitle: true,
//         ),
//         body: PhotoViewGallery.builder(
//           scrollPhysics: const BouncingScrollPhysics(),
//           itemCount: _listOfImages.length,
//           builder: (BuildContext context, int index){
//             return PhotoViewGalleryPageOptions(
//               imageProvider: NetworkImage(widget.bost.data()['urlsMenu'][index]),
//               initialScale: PhotoViewComputedScale.contained*0.8,
//               heroAttributes: PhotoViewHeroAttributes(tag: _listOfImages[index]),
//             );
//
//           },
//
//           loadingBuilder: (context , event){
//             return Center(
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 child: CircularProgressIndicator(
//                   value: event == null ?0 : event.cumulativeBytesLoaded / event.expectedTotalBytes,
//                 ),
//               ),
//             );
//           },
//         ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'
    '';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MenuImageView extends StatefulWidget {
  final DocumentSnapshot bost;
  MenuImageView({this.bost});
  @override
  _MenuImageView createState() => _MenuImageView();
}

class _MenuImageView extends State<MenuImageView> {
  int i = 0;
  List<NetworkImage> _listOfImages = <NetworkImage>[];

  loop() {
    for (i = 0; i <= widget.bost.data()['urlsMenu'].length; i++) {
      print(i);
      return Image.network(
        widget.bost.data()['urlsMenu'][i],
        fit: BoxFit.cover,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    loop();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listOfImages = [];
    for (int i = 0; i < widget.bost.data()['urlsMenu'].length; i++) {
      _listOfImages.add(NetworkImage(widget.bost.data()['urlsMenu'][i]));
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(widget.bost.data()['name']),
          centerTitle: true,
        ),
        body: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          itemCount: _listOfImages.length,
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider:
                  NetworkImage(widget.bost.data()['urlsMenu'][index]),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes:
                  PhotoViewHeroAttributes(tag: _listOfImages[index]),
            );
          },
          loadingBuilder: (context, event) {
            return Center(
              child: Container(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  value: event == null
                      ? 0
                      : event.cumulativeBytesLoaded / event.expectedTotalBytes,
                ),
              ),
            );
          },
        ));
  }
}













































