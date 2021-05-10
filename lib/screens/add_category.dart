import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:rest_sent/constant.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddCategory extends StatefulWidget {
  static const id = 'AddCategory';
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  String _error = 'No Error Dectected';
  List<String> imageUrlsCategory = <String>[];

List <Asset>imageCategory =<Asset> [];
  Future<void> loadAssetsCat() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: imageCategory,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#D32F2F",
          actionBarTitle: "Upload image category",
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
      imageCategory = resultList;
      _error = error;
    });
  }

  Future<dynamic> postImage(Asset imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref().child(fileName);

    UploadTask uploadTask =
    ref.putData((await imageFile.getByteData()).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    return storageTaskSnapshot.ref.getDownloadURL();
  }
  void uploadimageCategory()async{
    for (var imageFile in imageCategory) {
      await postImage(imageFile).then((downloadUrl) {
        imageUrlsCategory.add(downloadUrl.toString());
      }).catchError((err) {
        print(err);
      });
    }

    await _collectionReference.doc(AddCategoyr.text).set({
'imageCategory' : imageUrlsCategory[0].toString(),
      'Category' : AddCategoyr.text

    }).then((_) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(snac('Uploded images succefully'));
      });


      setState(() {
  imageCategory = [];
  imageUrlsCategory = [] ;
  AddCategoyr.clear();

      });
    });

  }



  Future delete(AsyncSnapshot snapshot, int i)async{


    await _collectionReference.doc(snapshot.data.docs[i].data()['Category']).delete();

    await firebase_storage.FirebaseStorage.instance
        .refFromURL(snapshot.data.docs[i].data()['imageCategory'])
        .delete();
  }

  final AddCategoyr = TextEditingController();
  CollectionReference _collectionReference = FirebaseFirestore.instance.collection('category');
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cate=[];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Color(0xFFD32F2F),
  centerTitle: true,
  title: Text('Add category',
    style: TextStyle(
        color: Colors.white,
        fontSize: 20.0
    ),),

),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  width: MediaQuery.of(context).size.width*.7,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: AddCategoyr,
                    decoration: KTextDecoration.copyWith(
                        hintText: 'Enter your category'),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:12.0),
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
                            "Add category image",
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.045,
                                color: Colors.white),
                          ),
                          onPressed: loadAssetsCat, // مطعم
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Color(0xFFF44336),
                      //     borderRadius: BorderRadius.all(Radius.circular(20.0),
                      //     ),
                      //   ),
                      //   child: FlatButton(
                      //     child: Text(
                      //       "Delete",
                      //       style: TextStyle(
                      //           fontSize:
                      //           MediaQuery.of(context).size.width * 0.045,
                      //           color: Colors.white),
                      //     ),
                      //     onPressed: (){
                      //       setState(() {
                      //         cate.remove(dataDrop);
                      //
                      //         AddCategoyr.clear();
                      //       });
                      //     }, // مطعم
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:12.0),
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
                            "Add",
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.045,
                                color: Colors.white),
                          ),
                          onPressed: (){

                              // await _collectionReference.doc(AddCategoyr.text).set({
                              //   'Category' : AddCategoyr.text
                              // });
                              // cate.add(AddCategoyr.text);
                              // AddCategoyr.clear();

                              if (imageCategory.length == 0) {
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
                              }else {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snac('Please wait, we are uploading'));
                                });
                                uploadimageCategory();
                              }




                          }, // مطعم
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Color(0xFFF44336),
                      //     borderRadius: BorderRadius.all(Radius.circular(20.0),
                      //     ),
                      //   ),
                      //   child: FlatButton(
                      //     child: Text(
                      //       "Delete",
                      //       style: TextStyle(
                      //           fontSize:
                      //           MediaQuery.of(context).size.width * 0.045,
                      //           color: Colors.white),
                      //     ),
                      //     onPressed: (){
                      //       setState(() {
                      //         cate.remove(dataDrop);
                      //
                      //         AddCategoyr.clear();
                      //       });
                      //     }, // مطعم
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white60,
                //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //   ),
                //   width: MediaQuery.of(context).size.width*.5,
                //   child: DropdownButton(
                //     hint: Center(child: Center(child: Text('select category'))),
                //     value: dataDrop,
                //     isExpanded: true,
                //     onChanged: (value) {
                //       setState(() {
                //         dataDrop = value;
                //
                //       });
                //     },
                //     items: cate.map((e) {
                //       return DropdownMenuItem(child: Center(child: Text(e)), value: e);
                //     }).toList(),
                //     dropdownColor: Colors.white,
                //   ),
                // ),



                Padding(
                  padding: const EdgeInsets.only(right:20.0, left: 20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*.7,
                    child: StreamBuilder(
                      stream: _collectionReference.snapshots(),
                      builder: (context , snapshot){
                        if(snapshot.hasError){
                          return Center(child: Text('Loading'));
                        }
                        if(snapshot.hasData){
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context , i){

                                return Padding(padding: EdgeInsets.only(top:10, bottom: 10,
                                right: 10, left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snapshot.data.docs[i].data()['Category'],
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*.05
                                    ),),
                                      IconButton(icon:Icon( Icons.delete_forever_outlined
                                        ,
                                        color: Colors.red,
                                        size: 30,), onPressed: (){
                                        setState(() {
                                          // await _collectionReference.doc(snapshot.data.docs[i].data()['Category']).delete();
                                          //
                                          // await firebase_storage.FirebaseStorage.instance
                                          //     .refFromURL(snapshot.data.docs[i].data()['imageCategory'])
                                          //     .delete();
                                          delete(snapshot, i);

                                        });

                                      }),



                                  ],
                                ),
                                );
                              });
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    // child:ListView.builder(
                    //     itemCount :cate.length
                    //     ,itemBuilder: (context , i){
                    //   return Container(
                    //     child: GestureDetector(
                    //       child: Text(cate[i],
                    //       style: TextStyle(
                    //         fontSize: 18.0
                    //       ),),
                    //     ),
                    //   );
                    //
                    // }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
