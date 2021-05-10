import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rest_sent/screens/add_admin.dart';
import 'package:rest_sent/screens/add_category.dart';
import 'package:rest_sent/screens/add_rest.dart';
import 'package:rest_sent/screens/category.dart';
import 'package:rest_sent/screens/log_in.dart';
import 'package:rest_sent/screens/notification.dart';
import 'package:rest_sent/screens/reset_password.dart';
import 'package:rest_sent/screens/rest.dart';
import 'package:rest_sent/screens/showing_category.dart';
import 'package:rest_sent/screens/view_image.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {


  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MyApp(),
  );
}

// final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: LogIn(),
      routes: {
LogIn.id : (context) =>LogIn(),
        Rest.id : (context) => Rest(),
        AddRest.id : (context) => AddRest(),
        AddAdmin.id : (context) => AddAdmin(),
        Notify.id : (context) => Notify(),
       // MyHomePage.id : (context) => MyHomePage(),
        ResetPass.id : (context) => ResetPass(),
        Category.id : (context) => Category(),
        AddCategory.id : (context) => AddCategory(),
        ShowingCategory.id : (context) => ShowingCategory(),


        // ShowingData.id :(context) => ShowingData()


      },
    );
  }
}
//
// class First extends StatefulWidget {
//   @override
//   _FirstState createState() => _FirstState();
// }
//
// class _FirstState extends State<First> {
//   String name, meal, price;
//   // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   List<Asset> images = <Asset>[];
//   String _error = 'No Error Dectected';
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: 3,
//       children: List.generate(images.length, (index) {
//         Asset asset = images[index];
//         return AssetThumb(
//           asset: asset,
//           width: 300,
//           height: 300,
//         );
//       }),
//     );
//   }
//
//   Future<void> loadAssets() async {
//     List<Asset> resultList = <Asset>[];
//     String error = 'No Error Detected';
//
//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 300,
//         enableCamera: true,
//         selectedAssets: images,
//         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Example App",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       error = e.toString();
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       images = resultList;
//       _error = error;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.blue,
//       appBar: AppBar(),
//       body: Center(
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextField(
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   name = value;
//                 },
//               ),
//               TextField(
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   meal = value;
//                 },
//               ),
//               TextField(
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   price = value;
//                 },
//                 keyboardType: TextInputType.number,
//               ),
//               FlatButton(
//                   onPressed: () {
//                     //
//                     _firebaseFirestore.collection(name).add({
//                       'meal': meal,
//                       'price': price,
//                     });
//                   },
//                   child: Text('send')),
//               SizedBox(
//                 height: 20.0,
//               ),
//               ElevatedButton(
//                 child: Text("Pick images"),
//                 onPressed: loadAssets,
//               ),
//               Expanded(
//                 child: buildGridView(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
