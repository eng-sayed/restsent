import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rest_sent/constant.dart';

import 'package:rest_sent/widget/rounded_buttom.dart';


class ResetPass extends StatefulWidget {
  static const id = 'ResetPass';

  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {


  String email  ;
FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        // title: Text('Add Admin'
        // ,style: TextStyle(
        //     fontSize:
        //       MediaQuery.of(context).size.width * 0.052,
        //   ),),
        // centerTitle: true,
      ),
      //drawer: DrawerWidget(),
      body:

         SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
            child: Column(
              children: [
                Image.asset('images/logo.png', scale: .5,),
                TextField(onChanged: (value){
                  email = value ;
                },
                  textAlign: TextAlign.center,
                  decoration: KTextDecoration.copyWith(hintText: 'Enter your email',
                  ),
                ),
                SizedBox(height: 20.0,)
             
                ,SizedBox(height: 20.0,),

                RoundedButton(
                  onPressed: ()async{
                    
                    try{


                      await  auth.sendPasswordResetEmail(email: email);
                      Navigator.pop(context);
                    }
                    on FirebaseAuthException catch (e) {
                      print(e);


                      if (e.code == 'user-not-found') {
                        setState(() {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snac('user not found'));

                        });
                        print('No user found for that email.');
                      }

                    }
                    
                    

                  },



                  color: Color(0xFFF44336),
                  btnName: 'Reset Password',)
              ],
            ),
          ),
        ),


    );
  }
}
