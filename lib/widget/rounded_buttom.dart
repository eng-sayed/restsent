import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnName;
  final Color color , colorText;
  final Function onPressed;
  RoundedButton(
      {@required this.onPressed,
        this.color,
        this.btnName, this.colorText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$btnName',
            style: TextStyle(
              color: colorText,
              fontSize:
              MediaQuery.of(context).size.width * 0.045,            ),
          ),
        ),
      ),
    );
  }
}



class RoundedContainer extends StatelessWidget {
  final String btnName;
  final Color color , colorText;
  RoundedContainer(
      {
        this.color,
        this.btnName, this.colorText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$btnName',
            style: TextStyle(
              color: colorText,
              fontSize:
              MediaQuery.of(context).size.width * 0.045,            ),
          ),
        ),
      ),
    );
  }
}