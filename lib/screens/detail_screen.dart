// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// //
// //
// // class DetailsScreen extends StatefulWidget {
// //   final DocumentSnapshot documentSnapshot ;
// //   DetailsScreen({@required this.documentSnapshot});
// //   @override
// //   _DetailsScreenState createState() => _DetailsScreenState();
// // }
// //
// // class _DetailsScreenState extends State<DetailsScreen> {
// //   CollectionReference restref = FirebaseFirestore.instance.collection('rest');
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.red,
// //         title: Text('Menu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
// //       ),
// //       backgroundColor: Color(0xFFF6F6F6),
// //       body: StreamBuilder(
// //         stream: restref.snapshots(),
// //         builder: (context, snapshot){
// //           if (snapshot.hasError){
// //             return Text('error');
// //           }
// //           if(snapshot.hasData){
// //             return ListView.builder(
// //               itemCount: snapshot.data.docs.length,
// //               itemBuilder: (context, i){
// //                 return Column(
// //                   children: [
// //                     Card(margin: EdgeInsets.all(10),
// //                       child: Image.network('${['urlsMenu']}'),),
// //                     Text(snapshot.data.docs[i].data()['name'].toString())
// //
// //                   ],
// //                 );
// //               },
// //             );
// //           }
// //           return Center(child: CircularProgressIndicator(),);
// //         },
// //       ),
// //     );
// //   }
// // }
//
// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // // import 'package:carousel_slider/carousel_slider.dart';
// //
// // class DetailsScreen extends StatefulWidget {
// //    var post ;
// //   DetailsScreen({this.post});
// //   @override
// //   _DetailsScreenState createState() => _DetailsScreenState();
// // }
// //
// // class _DetailsScreenState extends State<DetailsScreen> {
// //   CollectionReference restMenuref = FirebaseFirestore.instance.collection('rest');
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.red,
// //         title: Text('Menu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
// //       ),
// //       backgroundColor: Color(0xFFF6F6F6),
// //       body: StreamBuilder(
// //           stream: restMenuref.doc(widget.post.toString()).snapshots(),
// //           builder:  (context, snapshot) {
// //             if (snapshot.hasError) {
// //               return Text('error');
// //             }
// //             if (snapshot.hasData) {
// //               return ListView.builder(itemCount: widget.post.data().length,
// //                   itemBuilder: (context, i) {
// //                     return ListView(
// //                       itemExtent: snapshot.data.docs.length.toDouble(),
// //                       children: [
// //                         // Image.network('${snapshot.data.docs[i].data()['urlsMenu']}')     widget.post.data()['urlsMenu']
// //                     //    Image.network('${widget.post.data()['urlsMenu']}'),
// //                         Text(widget.post['name'],style: TextStyle(
// //                           fontSize: 50.0
// //                         ),)
// //                       ],
// //                     );
// //                   });
// //             }
// //             return Center(child: CircularProgressIndicator());
// //           }),
// //     );
// //   }
// // }
//
// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
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
//       return Image.network(widget.post.data()['urlsMenu'][i]);
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
//           title: Text(widget.post.data()['name']),
//           centerTitle: true,
//         ),
//         body: Container(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // loop(),
//                 Container(
//                  // margin: EdgeInsets.all(10.0),
//                  //  height: 300,
//                  //  decoration: BoxDecoration(
//                  //    color: Colors.white,
//                  //  ),
//                   width: MediaQuery.of(context).size.width,
//                   child: InteractiveViewer(
//                     child: Carousel(
//
//                         boxFit: BoxFit.cover,
//                         images: _listOfImages,
//                         autoplay: false,
//                         indicatorBgPadding: 5.0,
//                         dotPosition: DotPosition.bottomCenter,
//                         animationCurve: Curves.fastOutSlowIn,
//                         animationDuration: Duration(milliseconds: 2000)),
//                   ),
//                 ),
//
//                 GestureDetector(
//                   child: Text(
//                     widget.post.data()['nums'][0],
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   onTap: () async {
//                     setState(() {
//                       // List  num = [];
//
//                       FlutterPhoneDirectCaller.callNumber(loopnum()[0].toString());
//
//
//                     });
//                   },
//                 ),
//                 GestureDetector(
//                   child: Text(
//                     widget.post.data()['nums'][1],
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   onTap: () async {
//
//
//                       FlutterPhoneDirectCaller.callNumber(loopnum()[1].toString());
//
//
//                   },
//                 ),GestureDetector(
//                   child: Text(
//                     widget.post.data() ['nums'][2],
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   onTap: () async {
//
//
//                       FlutterPhoneDirectCaller.callNumber(loopnum()[2].toString());
//
//
//
//                   },
//                 ),GestureDetector(
//                   child: Text(
//                     widget.post.data()['nums'][3].toString(),
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   onTap: () async {
//
//
//                       FlutterPhoneDirectCaller.callNumber(loopnum()[3].toString());
//
//
//
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:rest_sent/constant.dart';
import 'package:rest_sent/screens/test.dart';

class DetailsScreen extends StatefulWidget {
  final DocumentSnapshot post;
  DetailsScreen({this.post});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int i = 0;
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  CollectionReference restref = FirebaseFirestore.instance.collection('rest');
  final category = TextEditingController();

  // loop() {
  //   for (i = 0; i <= widget.post.data()['urlsMenu'].length; i++) {
  //     print(i);
  //     return Image.network(
  //       widget.post.data()['urlsMenu'][i],
  //       fit: BoxFit.cover,
  //     );
  //   }
  // }

  List num = [];

  // loopnum() {
  //   setState(() {
  //     for (int g = 0; g < widget.post.data()['nums'].length; g++) {
  //       num.add(Padding(
  //         padding: EdgeInsets.all(10),
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(25),
  //           child: Container(
  //             color: Color(0xFFBDBDBD),
  //             height: 40,
  //             width: 300,
  //             child: RaisedButton(
  //               child: Row(children: [
  //                 Icon(Icons.add_ic_call_rounded),
  //                 SizedBox(
  //                   width: 50,
  //                 ),
  //                 Text(
  //                   widget.post.data()['nums'][g],
  //                   style: TextStyle(fontSize: 20.0),
  //                 ),
  //               ]),
  //               onPressed: () async {
  //                 FlutterPhoneDirectCaller.callNumber(
  //                     loopnum()[0].toString());
  //               },
  //             ),
  //           ),
  //         ),
  //       ));
  //     }
  //   });
  //   return num;
  // }

  numbers() async {
    num = [];
    for (int g = 0; g < widget.post.data()['nums'].length; g++) {
      num.add(Padding(
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: Color(0xFFBDBDBD),
            height: 40,
            width: 200,
            child: RaisedButton(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.add_ic_call_rounded),
                    Text(
                      widget.post.data()['nums'][g],
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ]),
              onPressed: () async {
                print(num);
                FlutterPhoneDirectCaller.callNumber(
                    widget.post.data()['nums'][g].toString());
              },
            ),
          ),
        ),
      ));
    }
  }

  images() async {
    _listOfImages = [];
    for (int i = 0; i < widget.post.data()['urlsMenu'].length; i++) {
      _listOfImages.add(NetworkImage(widget.post.data()['urlsMenu'][i]));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    //loop();
    numbers();
    images();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() async {
                  await restref.doc(widget.post.id).delete();
                  await firebase_storage.FirebaseStorage.instance
                      .refFromURL(widget.post.data()['urlsrest'])
                      .delete();

                  for (int j = 0;
                      j < widget.post.data()['urlsMenu'].length;
                      j++) {
                    await firebase_storage.FirebaseStorage.instance
                        .refFromURL(widget.post.data()['urlsMenu'][j])
                        .delete();
                  }

                  Navigator.of(context, rootNavigator: true).pop();
                });
              },
            )
          ],
          backgroundColor: Color(0xFFD32F2F),
          title: Text(widget.post.data()['name']),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // loop(),
            // Container(
            //   margin: EdgeInsets.all(10.0),
            //   height: 400,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //   ),
            //   width: MediaQuery.of(context).size.width,
            //   child: InteractiveViewer(
            //     child: Carousel(
            //         onImageTap: (ss) {
            //           print(ss);
            //      return     Container(
            //        child: PhotoView(
            //               imageProvider: _listOfImages[ss]
            //            // AssetImage("assets/large-image.jpg"),
            //             ),
            //      );
            //         },
            //         boxFit: BoxFit.fitHeight,
            //         images: _listOfImages,
            //         autoplay: false,
            //         indicatorBgPadding: 5.0,
            //         dotPosition: DotPosition.bottomCenter,
            //         animationCurve: Curves.fastOutSlowIn,
            //         animationDuration: Duration(milliseconds: 2000)),
            //   ),
            // ),

            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * .5,
              width: double.infinity,
              child: GestureDetector(
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  itemCount: _listOfImages.length,
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider:
                          NetworkImage(widget.post.data()['urlsMenu'][index]),
                      initialScale: PhotoViewComputedScale.contained * 1,
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
                              : event.cumulativeBytesLoaded /
                                  event.expectedTotalBytes,
                        ),
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return MenuImageView(bost: widget.post);
                  }));
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  width: MediaQuery.of(context).size.width*.5,
                  child: DropdownButton(
                    //hint: Text('select catefory'),
                    value: widget.post.data()['cate'],
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        dataDrop = value;
                      });
                    },
                    items: cate.map((e) {
                      return DropdownMenuItem(child: Text(e), value: e);
                    }).toList(),
                    dropdownColor: Colors.white60,
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: ()async {
                      await widget.post
                          .reference.update({
                        'cate': dataDrop,

                      });
                    },
                    child: Text(
                        'Update category'
                    ),),
                )
              ],
            ),

            // ClipRRect(
            //   borderRadius: BorderRadius.circular(25),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         // SizedBox(width: 160,),
            Text(
              'Call Us',
              style: TextStyle(fontSize: 22),
            )
            //       ]),
            // ),
            ,
            SizedBox(
              height: 5,
            ),
            // widget.post.data()['nums'][0] != null ?
            //  Padding(
            //    padding: EdgeInsets.all(10),
            //    child: ClipRRect(
            //      borderRadius: BorderRadius.circular(25),
            //      child: Container(
            //        color: Color(0xFFBDBDBD),
            //        height: 40,
            //        width: 300,
            //        child: RaisedButton(
            //          child: Row(children: [
            //            Icon(Icons.add_ic_call_rounded),
            //            SizedBox(
            //              width: 50,
            //            ),
            //            Text(
            //              widget.post.data()['nums'][0],
            //              style: TextStyle(fontSize: 20.0),
            //            ),
            //          ]),
            //          onPressed: () async {
            //            FlutterPhoneDirectCaller.callNumber(
            //                loopnum()[0].toString());
            //          },
            //        ),
            //      ),
            //    ),
            //  ):Text(''),
            //  SizedBox(
            //    height: 10,
            //  ),
            //  widget.post.data()['nums'][1] != " " ?Padding(
            //    padding: EdgeInsets.all(10),
            //    child: ClipRRect(
            //      borderRadius: BorderRadius.circular(25),
            //      child: Container(
            //        color: Color(0xFFBDBDBD),
            //        height: 40,
            //        width: 300,
            //        child: RaisedButton(
            //          child: Row(children: [
            //            Icon(Icons.add_ic_call_rounded),
            //            SizedBox(
            //              width: 50,
            //            ),
            //            Text(
            //              widget.post.data()['nums'][1],
            //              style: TextStyle(fontSize: 20.0),
            //            ),
            //          ]),
            //          onPressed: () async {
            //            FlutterPhoneDirectCaller.callNumber(
            //                loopnum()[1].toString());
            //          },
            //        ),
            //      ),
            //    ),
            //  ):Text(''),
            //
            //  SizedBox(
            //    height: 10,
            //  ),
            //  widget.post.data()['nums'][2] != null ? Padding(
            //    padding: EdgeInsets.all(10),
            //    child: ClipRRect(
            //      borderRadius: BorderRadius.circular(25),
            //      child: Container(
            //        color: Color(0xFFBDBDBD),
            //        height: 40,
            //        width: 300,
            //        child: RaisedButton(
            //          child: Row(children: [
            //            Icon(Icons.add_ic_call_rounded),
            //            SizedBox(
            //              width: 50,
            //            ),
            //            Text(
            //              widget.post.data()['nums'][2],
            //              style: TextStyle(fontSize: 20.0),
            //            ),
            //          ]),
            //          onPressed: () async {
            //            FlutterPhoneDirectCaller.callNumber(
            //                loopnum()[2].toString());
            //          },
            //        ),
            //      ),
            //    ),
            //  ):Text(''),
            //
            //  SizedBox(
            //    height: 10,
            //  ),
            //  widget.post.data()['nums'][3] != null ? Padding(
            //    padding: EdgeInsets.all(10),
            //    child: ClipRRect(
            //      borderRadius: BorderRadius.circular(25),
            //      child: Container(
            //        color: Color(0xFFBDBDBD),
            //        height: 40,
            //        width: 300,
            //        child: RaisedButton(
            //          child: Row(children: [
            //            Icon(Icons.add_ic_call_rounded),
            //            SizedBox(
            //              width: 50,
            //            ),
            //            Text(
            //              widget.post.data()['nums'][3],
            //              style: TextStyle(fontSize: 20.0),
            //            ),
            //          ]),
            //          onPressed: () async {
            //            FlutterPhoneDirectCaller.callNumber(
            //                loopnum()[3].toString());
            //          },
            //        ),
            //      ),
            //    ),
            //  ):Text(''),
            //
            //









            Expanded(
              //  height: MediaQuery.of(context).size.height*.4,
              child: ListView.builder(
                  itemCount: num.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return num[index];
                  }),
            )





          ],
        ));
  }
}
