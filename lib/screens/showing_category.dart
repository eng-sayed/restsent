import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rest_sent/constant.dart';
import 'package:rest_sent/screens/category.dart';
import 'package:rest_sent/screens/rest.dart';
import 'package:rest_sent/widget/rounded_buttom.dart';
class ShowingCategory extends StatefulWidget {
  static const id = 'ShowingCategory';

  @override
  _ShowingCategoryState createState() => _ShowingCategoryState();
}

class _ShowingCategoryState extends State<ShowingCategory> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF44336),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0, ),
            child: Column(

              children: [


                RoundedButton(onPressed:  () => Navigator.pushNamed(context, ShowingCategory.id),
                  btnName:'All Restaurant',
                  color: Color(0xFFF44336),
                  colorText: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height*.9,
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

                              scrollDirection: Axis.vertical,
                              itemCount: newCAt.length,




                              itemBuilder: (context , i){

                                return RoundedButton(onPressed:  () => navigatToCategory(newCAt.elementAt(i)),
                                  btnName:newCAt.elementAt(i),
                                  color: Color(0xFFF44336),
                                  colorText: Colors.white,
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
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
