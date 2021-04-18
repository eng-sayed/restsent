import 'dart:ffi';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:rest_sent/constant.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';



class AddRest extends StatefulWidget {
  static const id = 'AddRest';

  @override
  _AddRestState createState() => _AddRestState();
}

class _AddRestState extends State<AddRest> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final num1 = TextEditingController();
  final num2 = TextEditingController();
  final num3 = TextEditingController();
  final num4 = TextEditingController();
  final city = TextEditingController();

  final String imagerest = '';
  final restName = TextEditingController();
  Future<QuerySnapshot> _documentSnapshot =
      FirebaseFirestore.instance.collection('rest').get();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Asset> imageRest = <Asset>[];
  List<Asset> imagesMenu = <Asset>[];

  List<String> imageUrls = <String>[];
  List<String> imageUrlsMenu = <String>[];
  List nums = [];

  String _error = 'No Error Dectected';
  bool isUploading = false;
  @override
  void initState() {
    super.initState();
  }
///////////////////////////////////////// عرض الصور ف جريد فيو ////////////////////////////////
  // Widget buildGridView() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     children: List.generate(imageRest.length, (index) {
  //       Asset asset = imageRest[index];
  //       return AssetThumb(
  //         asset: asset,
  //         width: 300,
  //         height: 300,
  //       );
  //     }),
  //   );
  // }
  //
  // Widget buildGridView1() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     children: List.generate(imagesMenu.length, (index) {
  //       Asset asset = imagesMenu[index];
  //       return AssetThumb(
  //         asset: asset,
  //         width: 300,
  //         height: 300,
  //       );
  //     }),
  //   );
  // }
  ////////////////////////////////////////////////////////////////////////////////

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: imageRest,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#D32F2F",
          actionBarTitle: "Upload image",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;
    setState(() {
      imageRest = resultList;
      _error = error;
    });
  }

  Future<void> loadAssets1() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: imagesMenu,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#D32F2F",
          actionBarTitle: "Upload image",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;
    setState(() {
      imagesMenu = resultList;
      _error = error;
    });
  }

  List nameIndex = [];

  void uploadImages() async {
    // String documnetID = DateTime.now().millisecondsSinceEpoch.toString();

    for (var imageFile in imageRest) {
      await postImage(imageFile).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
        // if (imageUrls.length == imageRest.length) {
        //   //String documnetID = 'images of ${restName.text}';
        //   FirebaseFirestore.instance
        //       .collection('rest')
        //       .doc(documnetID)
        //       .set({'urls': imageUrls}).then((_) {
        //     setState(() {
        //       ScaffoldMessenger.of(context)
        //           .showSnackBar(snac('Uploded succefully'));
        //     });
        //     setState(() {
        //       imageRest = [];
        //       imageUrls = [];
        //     ////
        //     });
        //   });
        // }
      }).catchError((err) {
        print(err);
      });
    }
    for (var imageFile in imagesMenu) {
      await postImage(imageFile).then((downloadUrl) {
        imageUrlsMenu.add(downloadUrl.toString());
        // if (imageUrlsMenu.length == imagesMenu.length) {
        //   //  String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
        //   //String documnetID = 'images of ${restName.text}';
        //   FirebaseFirestore.instance
        //       .collection('rest')
        //       .doc(documnetID)
        //       .set({'urlsMenu': imageUrlsMenu}).then((_) {
        //     setState(() {
        //       ScaffoldMessenger.of(context)
        //           .showSnackBar(snac('Uploded Menu succefully'));
        //     });
        //     setState(() {
        //       restName.clear();
        //       imagesMenu = [];
        //       // imageRest = [];
        //
        //       imageUrlsMenu = [];
        //     });
        //   });
        //}
      }).catchError((err) {
        print(err);
      });
    }
    // List catee= [];
    // catee.add(dataDrop);
    // await _firebaseFirestore.collection('category').doc('category Data').update(
    //     {
    //       'cate': 'fdf'
    //       , 'cate' : 'derwer'
    //     } );
    // await _firebaseFirestore.collection(dataDrop).doc().set({
    //   'serch': nameIndex,
    //   'name': restName.text,
    //   'city': city.text,
    //   'nums': nums,
    //   'urlsMenu': imageUrlsMenu,
    //   'urlsrest': imageUrls[0].toString(),
    //   'cate': catee.toList()
    // });
    await _firebaseFirestore.collection('rest').doc().set({
      'serch': nameIndex,
      'name': restName.text,
      'city': city.text,
      'nums': nums,
      'urlsMenu': imageUrlsMenu,
      'urlsrest': imageUrls[0].toString(),
      'cate': dataDrop
    }).then((_) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(snac('Uploded images succefully'));
      });


      setState(() {
        restName.clear();
        imagesMenu = [];
        imageRest = [];
        imageUrls = [];
        imageUrlsMenu = [];
        nameIndex = [];
        city.clear();
        num3.clear();
        num2.clear();
        num1.clear();
        num4.clear();
      });
    });




  }
  // void uploadMenu()async{
  //
  //   for (var imageFile in imagesMenu) {
  //    await postImage(imageFile).then((downloadUrl) {
  //       imageUrlsMenu.add(downloadUrl.toString());
  //       if (imageUrlsMenu.length == imagesMenu.length) {
  //       //  String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
  //         //String documnetID = 'images of ${restName.text}';
  //         FirebaseFirestore.instance
  //             .collection('rest')
  //             .doc()
  //             .set({'urlsMenu': imageUrlsMenu}).then((_) {
  //           setState(() {
  //             ScaffoldMessenger.of(context)
  //                 .showSnackBar(snac('Uploded Menu succefully'));
  //           });
  //           setState(() {
  //             restName.clear();
  //             imagesMenu = [];
  //             // imageRest = [];
  //
  //             imageUrlsMenu = [];
  //           });
  //         });
  //       }
  //     }).catchError((err) {
  //       print(err);
  //     });
  //   }
  // }

  Future<dynamic> postImage(Asset imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(fileName);

    UploadTask uploadTask =
        ref.putData((await imageFile.getByteData()).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    return storageTaskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      //  drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        title: Text(
          'Add Restaurant',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    controller: restName,
                    decoration: KTextDecoration.copyWith(
                        hintText: 'Enter resturant name'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: num1,
                    keyboardType: TextInputType.phone,
                    decoration: KTextDecoration.copyWith(
                        hintText: 'Enter first number'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    controller: num2,
                    decoration: KTextDecoration.copyWith(
                        hintText: 'Enter second number'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    controller: num3,
                    decoration: KTextDecoration.copyWith(
                        hintText: 'Enter third number'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    controller: num4,
                    decoration: KTextDecoration.copyWith(
                        hintText: 'Enter forth number'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: city,
                    decoration:
                        KTextDecoration.copyWith(hintText: 'Enter city'),
                  ),
                ),

                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Category'
                      , style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                        ),),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        width: MediaQuery.of(context).size.width*.5,
                        child: DropdownButton(
                          value: dataDrop,
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
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF44336),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Pick menu",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                color: Colors.white),
                          ),
                          onPressed: loadAssets1,
                          // منيو
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF44336),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: FlatButton(
                            onPressed: () {
                              setState(() {
                                num1.text != '' ? nums.add(num1.text) : null;
                                num2.text != '' ? nums.add(num2.text) : null;
                                num3.text != '' ? nums.add(num3.text) : null;
                                num4.text != '' ? nums.add(num4.text) : null;

                                // nums = [
                                //   num1.text,
                                //   num2.text,
                                //   num3.text,
                                //   num4.text
                                // ];
                                String x = '';
                                for (int i = 0; i < restName.text.length; i++) {
                                  for (int j = 0; j <= i; j++) {
                                    x += restName.text[j];
                                  }
                                  nameIndex.add(x);
                                  x = '';
                                }
                              });

                              if (imageRest.length == 0) {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        backgroundColor:
                                            Theme.of(context).backgroundColor,
                                        content: Text("No image selected",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      );
                                    });
                              } else {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snac('Please wait, we are uploading'));
                                });
                                uploadImages();
                              }
                            },
                            child: Text(
                              'send',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  color: Colors.white),
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF44336),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Pick resturant",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                color: Colors.white),
                          ),
                          onPressed: loadAssets, // مطعم
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Container(
                //   child: ElevatedButton(
                //     child: Text("navigate"),
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => Sayed()) );
                //       ;
                //     },
                //   ),
                // ),
                // Expanded(
                //   child: buildGridView(),
                // ),
                // Container(
                //   child: Expanded(
                //     child: buildGridView1(), // منيو
                //   ),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
