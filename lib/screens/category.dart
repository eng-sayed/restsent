
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rest_sent/constant.dart';
import 'package:rest_sent/screens/detail_screen.dart';

class Category extends StatefulWidget {
  static const id = 'Category';
  final nameCategory ;
  Category({this.nameCategory});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  navigatToDetail(DocumentSnapshot post) {
    //
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
              post: post,
            )));
  }



  String name = '';
  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
      body: StreamBuilder(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
            .collection(widget.nameCategory)
            .where("serch", arrayContains: name)
          //   .
          // where('cate' , arrayContains: widget.nameCategory)
            .snapshots()
            : FirebaseFirestore.instance.collection(widget.nameCategory)
        //     .
        // where('cate' , arrayContains: widget.nameCategory)
        .snapshots(),
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

    );
  }
}
