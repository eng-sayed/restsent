import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rest_sent/screens/add_admin.dart';
import 'package:rest_sent/screens/add_category.dart';
import 'package:rest_sent/screens/add_rest.dart';
import 'package:rest_sent/screens/log_in.dart';
import 'package:rest_sent/screens/notification.dart';
class DrawerWidget extends StatefulWidget {
  // User loginUser ;
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
user(){  FirebaseAuth auth = FirebaseAuth.instance;

if (auth.currentUser != null) {
 return auth.currentUser.email.toString();
}}
Future deleteUser()async{


    await FirebaseAuth.instance.currentUser.delete();

}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
           child: Center(
             child: Text(user(),
             style: TextStyle(
               fontSize: MediaQuery.of(context).size.width*.06,
               color: Colors.white
             ),),
           ),
            decoration: BoxDecoration(
              color: Color(0xFFD32F2F),
            ),
          ),
          ListTile(leading: Icon(Icons.restaurant,color: Color(0xFF212121),),
            title: Text('Add resturant',
              style: TextStyle(
                  fontSize: 19.0,
                color: Color(0xFF212121),
              ),),
            onTap: () {
              Navigator.pop(context);            Navigator.pushNamed(context, AddRest.id);


              // Update the state of the app.
              // ...
            },
          ),
          ListTile(leading: Icon(Icons.category,color: Color(0xFF212121),),
            title: Text('Add category',
              style: TextStyle(
                fontSize: 19.0,color: Color(0xFF212121),
              ),),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AddCategory.id);
              //

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(leading: Icon(Icons.person_add,color: Color(0xFF212121),),
            title: Text('Add admin',
              style: TextStyle(
                  fontSize: 19.0,color: Color(0xFF212121),
              ),),
            onTap: () {
            Navigator.pop(context);
              Navigator.pushNamed(context, AddAdmin.id);
              //

              // Update the state of the app.
              // ...
            },
          ),  ListTile(leading: Icon(Icons.notification_important,color: Color(0xFF212121),),
            title: Text('notification',
              style: TextStyle(
                fontSize: 19.0,color: Color(0xFF212121),
              ),),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Notify.id);
              //

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(leading: Icon(Icons.person_remove,color: Color(0xFF212121),),
            title: Text('Delete user',
              style: TextStyle(
                fontSize: 19.0,color: Color(0xFF212121),
              ),),
            onTap: () {

setState(() {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor:Colors.white,
          content: Text("Are you sure ?",
              style:
              TextStyle(color: Colors.black)),
            actions: [TextButton(onPressed: (){
              setState(() {

                deleteUser();

                Navigator.pushReplacementNamed(context, LogIn.id);

              });
            }, child: Text('Delete'))]
        );
      });
});



              //

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(leading: Icon(Icons.logout,color: Color(0xFF212121),),
            title: Text('Log out',
            style: TextStyle(
              fontSize: 19.0,
              color: Color(0xFF212121),
            ),),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LogIn.id);



              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
