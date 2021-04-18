
import 'package:flutter/material.dart';

const KTextDecoration = InputDecoration(
  hintText: 'Enter your password.',
  hintStyle: TextStyle(fontSize: 15.0, color: Colors.black12),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF212121), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF212121), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

SnackBar snac(String mssg) {
  final snackBar = SnackBar(
    backgroundColor: Color(0xFF757575),
    elevation: 2.0,
    content: Text(mssg, style: TextStyle(
      color: Colors.white
    ),),
    // action: SnackBarAction(
    //   label: 'delete',
    //   onPressed: () {
    //     // Some code to undo the change.
    //   },
    // ),
  );
  return snackBar;
}



final  restName= TextEditingController();






const KTextDecoration2 =InputDecoration(
  hintText: 'Search.....',
  suffixIcon: Icon(Icons.search,color: Colors.black,)
  ,hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);


List cate = <String>['pub', 'fol', 'sas', 'dffdg', 'fdgdf'];
String dataDrop ;