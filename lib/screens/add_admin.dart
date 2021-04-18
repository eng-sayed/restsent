import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rest_sent/constant.dart';

import 'package:rest_sent/widget/rounded_buttom.dart';

class AddAdmin extends StatefulWidget {
  static const id = 'AddAdmin';

  @override
  _AddAdminState createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  String email, pass;
  final email1 = TextEditingController();
  final pass1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        title: Text(
          'Add Admin',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.052,
          ),
        ),
        centerTitle: true,
      ),
      //drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              Image.asset(
                'images/logo.png',
                scale: .5,
              ),
              TextField(

                controller: email1,
                textAlign: TextAlign.center,
                decoration: KTextDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(

                controller: pass1,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: KTextDecoration,
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                onPressed: () async {
                  try {
                  await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email1.text.trim(),
                      password: pass1.text.trim(),
                    ).then((_) {
                      setState(() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snac('Account Added succefully'));
                        email1.clear();
                        pass1.clear();   });



                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      setState(() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snac('weak password'));
                      });
                    } else if (e.code == 'email-already-in-use') {
                      setState(() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snac('email already in use'));
                      });
                    }
                  }
                },
                color: Color(0xFFF44336),
                btnName: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
