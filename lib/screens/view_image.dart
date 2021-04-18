// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:rest_sent/constant.dart';
// import 'package:rest_sent/screens/test.dart';
//
// class ViewImages extends StatefulWidget {
//   static const id = 'View';
//
//   @override
//   _ViewImagesState createState() => _ViewImagesState();
// }
//
// class _ViewImagesState extends State<ViewImages> {
//   List<NetworkImage> _listOfImages = <NetworkImage>[];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         SizedBox(
//           height: 20,
//         ),
//         Flexible(
//             child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection('resturant').snapshots(),
//                 //.collection('sayed1')
//                 builder: (BuildContext  context,AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: snapshot.data.docs.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           _listOfImages = [];
//                           for (int i = 0;
//                           i <
//                               snapshot.data.docs[index].data()['urls']
//                                   .length;
//                           i++) {
//                             _listOfImages.add(NetworkImage(snapshot
//                                  .data.docs[index].data()['urls'][i]));
//                           }
//                           return Column(
//                             children: <Widget>[
//                               GestureDetector(onTap:(){
//                                 // setState(() {
//                                 //   Navigator.pushNamed(context, ShowingData.id);
//                                 // });
//                               },
//                                 child: Container(
//                                   margin: EdgeInsets.all(10.0),
//                                   height: 300,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                   ),
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Carousel(
//                                       boxFit: BoxFit.cover,
//                                       images: _listOfImages,
//                                       autoplay: false,
//                                       indicatorBgPadding: 5.0,
//                                       dotPosition: DotPosition.bottomCenter,
//                                       animationCurve: Curves.fastOutSlowIn,
//                                       animationDuration:
//                                       Duration(milliseconds: 2000)),
//                                 ),
//                               ),
//                               Container(
//                                 height: 1,
//                                 width: MediaQuery.of(context).size.width,
//                                 color: Colors.red,
//                               )
//                             ],
//                           );
//                         });
//                   } else {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 }))
//       ],
//     );
//   }
// }






















import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rest_sent/serch.dart';



class MyHomePage extends StatefulWidget {
     static const id = 'MyHomePage';

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; ++i) {
          queryResultSet.add(docs.docs[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Firestore search'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),

          SizedBox(height: 10.0),

          // StreamBuilder(
          // stream: restref.snapshots(),
          // builder: (context, snapshot) {
          // if (snapshot.hasError) {
          // return Text('error');
          // }
          // if (snapshot.hasData) {
          // return GridView.builder(


          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(element);
              }).toList())
        ]));
  }
}

Widget buildResultCard(data) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Container(
          child: Center(
              child: Text(data['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              )
          )
      )
  );
}





