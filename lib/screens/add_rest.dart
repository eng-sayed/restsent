

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:rest_sent/constant.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rest_sent/screens/rest.dart';



class AddRest extends StatefulWidget {
  static const id = 'AddRest';

  @override
  _AddRestState createState() => _AddRestState();
}

class _AddRestState extends State<AddRest> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final restName = TextEditingController();

  final number = TextEditingController();
  // final num2 = TextEditingController();
  // final num3 = TextEditingController();
  // final num4 = TextEditingController();
  final city = TextEditingController();

  final String imagerest = '';

  Future<QuerySnapshot> _documentSnapshot =
      FirebaseFirestore.instance.collection('rest').get();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;



  List<Asset> imageRest = <Asset>[];
  List<Asset> imagesMenu = <Asset>[];

  List<String> imageUrls = <String>[];
  List<String> imageUrlsMenu = <String>[];
  List nums = [];
  Set restCat = {};


  String _error = 'No Error Dectected';
  // bool isUploading = false;
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
          actionBarTitle: "Upload image restaurant",
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
        maxImages: 30,
        enableCamera: true,
        selectedAssets: imagesMenu,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#D32F2F",
          actionBarTitle: "Upload image menu",
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
    for(var e in restCat){
      await _firebaseFirestore.collection(e).doc(restName.text).set({
        'serch': nameIndex,
        'name': restName.text.toLowerCase(),
        'city': city.text,
        'nums': nums.toSet().toList(),
        'urlsMenu': imageUrlsMenu,
        'urlsrest': imageUrls[0].toString(),
        'cate': restCat.toSet().toList()
      });
    }
    await _firebaseFirestore.collection('rest').doc(restName.text).set({
      'serch': nameIndex,
      'name': restName.text.toLowerCase(),
      'city': city.text,
      'nums': nums.toSet().toList(),
      'urlsMenu': imageUrlsMenu,
      'urlsrest': imageUrls[0].toString(),
      'cate': restCat.toSet().toList()
    }).then((_)  {
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
        nums = [] ;
        restCat = {};
        // selectedNumber = null;
        // selectedCate = null ;
        city.clear();
        // num3.clear();
        // num2.clear();
        number.clear();
        // num4.clear();
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                    controller: city,
                    decoration:
                    KTextDecoration.copyWith(hintText: 'Enter city'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text('Number', style: TextStyle(
                            color: Colors.black,
                            fontSize: (MediaQuery.of(context).size.width)* 0.045
                        ),),
                      ),
                      Container(
width: MediaQuery.of(context).size.width*.55,
                        child:TextField(
                          textAlign: TextAlign.center,
                          controller: number,
                          keyboardType: TextInputType.phone,
                          decoration: KTextDecoration.copyWith(
                              hintText: 'Enter number'),
                        ),
                      ),
                      Container(

                        child: IconButton(icon: Icon(Icons.add ,color: Colors.black,), onPressed: (){
                          setState(() {
if(number.text != '' || number.text!= null){
  nums.add(number.text);
  number.clear();

  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor:Colors.white,
          content: Text("Number added",
              style:
              TextStyle(color: Colors.black)),
        );
      });
}else{
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor:Colors.white,
          content: Text("Can't added empty number",
              style:
              TextStyle(color: Colors.black)),
        );
      });
}


                          });
                        },),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey[300],
                //         offset: Offset(0.0, 1.0), //(x,y)
                //         blurRadius: 6.0,
                //       ),
                //     ],
                //   ),
                //   child: FlatButton(onPressed: (){
                //     setState(() {
                //       nums.add(number.text);
                //       number.clear();
                //     });
                //   }, child: Text('Add number',
                //   style: TextStyle(
                //       fontSize: (MediaQuery.of(context).size.width)* 0.045
                //   ),)
                //
                //   ),
                // ),
                SizedBox(
                  height: 10.0,
                ),

                // Container(
                //   child: TextField(
                //     textAlign: TextAlign.center,
                //     keyboardType: TextInputType.phone,
                //     controller: num2,
                //     decoration: KTextDecoration.copyWith(
                //         hintText: 'Enter second number'),
                //   ),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Container(
                //   child: TextField(
                //     textAlign: TextAlign.center,
                //     keyboardType: TextInputType.phone,
                //     controller: num3,
                //     decoration: KTextDecoration.copyWith(
                //         hintText: 'Enter third number'),
                //   ),
                // ),

                // Container(
                //   child: TextField(
                //     textAlign: TextAlign.center,
                //     keyboardType: TextInputType.phone,
                //     controller: num4,
                //     decoration: KTextDecoration.copyWith(
                //         hintText: 'Enter forth number'),
                //   ),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),



                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text('Category'
                        , style: TextStyle(
                            color: Colors.black,
                              fontSize: (MediaQuery.of(context).size.width)* 0.045
                          ),),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        width: MediaQuery.of(context).size.width*.5,
                        child: DropdownButton(
                          hint:Center(child: Text('select category')),
                          value: dataDrop,
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              dataDrop = value;
                            });
                          },
                          items: newCAt.map((e) {
                            return DropdownMenuItem(child: Center(child: Text(e)), value: e);
                          }).toList(),
                          dropdownColor: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add,
                        color: Colors.black,),
                        onPressed: (){
                          setState(() {

if(dataDrop != null){
  restCat.add(dataDrop);
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor:Colors.white,
          content: Text("Category added",
              style:
              TextStyle(color: Colors.black)),
        );
      });
}
           else{                  showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    backgroundColor:Colors.white,
                                    content: Text("Selected category is empty",
                                        style:
                                        TextStyle(color: Colors.black)),
                                  );
                                });

    }
                          });
                        },
                      )

                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Color(0xFFBDBDBD),
                //           offset: Offset(0.0, 1.0), //(x,y)
                //           blurRadius: 6.0,
                //         ),
                //       ],
                //     ),
                //     child: FlatButton(onPressed: (){
                //       setState(() {
                //         restCat.add(dataDrop);
                //       });
                //     }, child: Text('add Category'
                //       ,style: TextStyle(
                //           fontSize: (MediaQuery.of(context).size.width)* 0.045
                //       ),)),
                //   ),
                // ),

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
                            "Add Menu",
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
                          child: Text(
                            "Add Restaurant Picture",
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
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Text('Category',style: TextStyle(
                //         fontSize: (MediaQuery.of(context).size.width)* 0.045
                //       ),),
                //       Container(
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //         ),
                //         width: MediaQuery.of(context).size.width*.5,
                //         child: DropdownButton(
                //           hint:Center(child: Text('selected category')),
                //           value: selectedCate,
                //           isExpanded: true,
                //           onChanged: (value) {
                //             setState(() {
                //               selectedCate = value;
                //             });
                //           },
                //           items: restCat.toSet().map((e) {
                //             return DropdownMenuItem(child: Center(child: Text(e)), value: e);
                //           }).toList(),
                //           dropdownColor: Colors.white,
                //         ),
                //       ),
                //       FlatButton(onPressed: (){
                //         setState(() {
                //           restCat.remove(selectedCate);
                //
                //         });
                //       }, child: Text('Delete'))
                //     ],
                //   ),
                // ),










                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Category'
                        ,style: TextStyle(
                            fontSize: (MediaQuery.of(context).size.width)* 0.045
                        ),),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.25,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            width: MediaQuery.of(context).size.width*.8,
                            child: ListView.builder(
                                itemCount: restCat.length,
                                itemBuilder: (context , i){
                                  return  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text(restCat.elementAt(i),
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*.05
                                          ),),
                                      ),
                                      IconButton(icon: Icon(Icons.delete_forever_outlined , color: Colors.red ,
                                        size: 30,), onPressed: (){
                                        setState(() {
                                          restCat.remove(restCat.elementAt(i));
                                        });
                                      })
                                    ],
                                  );
                                }),
                            // child: DropdownButton(
                            //   hint:Center(child: Text('selected numbers')),
                            //    value: selectedNumber,
                            //   isExpanded: true,
                            //   onChanged: (value) {
                            //     setState(() {
                            //       selectedNumber  = value;
                            //     });
                            //   },
                            //   items: nums.toSet().map((e) {
                            //     return DropdownMenuItem(child: Center(child: Text(e)), value: e);
                            //   }).toList(),
                            //   dropdownColor: Colors.white,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


















                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Numbers'
                        ,style: TextStyle(
                            fontSize: (MediaQuery.of(context).size.width)* 0.045
                        ),),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                          height: MediaQuery.of(context).size.height*.25,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            width: MediaQuery.of(context).size.width*.8,
                            child: ListView.builder(
                                itemCount: nums.length,
                                itemBuilder: (context , i){
                                return  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text(nums[i],
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width*.05
                                      ),),
                                    ),
                                    IconButton(icon: Icon(Icons.delete_forever_outlined , color: Colors.red ,
                                        size: 30,), onPressed: (){
                                      setState(() {
                                        nums.remove(nums[i]);
                                      });
                                    })
                                  ],
                                  );
                                }),
                            // child: DropdownButton(
                            //   hint:Center(child: Text('selected numbers')),
                            //    value: selectedNumber,
                            //   isExpanded: true,
                            //   onChanged: (value) {
                            //     setState(() {
                            //       selectedNumber  = value;
                            //     });
                            //   },
                            //   items: nums.toSet().map((e) {
                            //     return DropdownMenuItem(child: Center(child: Text(e)), value: e);
                            //   }).toList(),
                            //   dropdownColor: Colors.white,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF44336),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                         // number.text != '' ? nums.add(number.text) : null;
                          // num2.text != '' ? nums.add(num2.text) : null;
                          // num3.text != '' ? nums.add(num3.text) : null;
                          // num4.text != '' ? nums.add(num4.text) : null;

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
                        'Add Restaurant',
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.width * 0.045,
                            color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
