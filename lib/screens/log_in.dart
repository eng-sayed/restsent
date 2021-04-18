import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rest_sent/constant.dart';
import 'package:rest_sent/screens/reset_password.dart';
import 'package:rest_sent/screens/rest.dart';
import 'package:rest_sent/widget/rounded_buttom.dart';


class LogIn extends StatefulWidget {
  static const id = 'Login';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool showSpinner = false;


  String email , pass ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
      } else {
        Navigator.pushReplacementNamed(context, Rest.id);
        print('User is signed in!');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,

      child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
            child: Column(
              children: [
                Flexible(child: Image.asset('images/logo.png', scale: .5,),),
                TextField(onChanged: (value){
                  email = value ;
                },
                  textAlign: TextAlign.center,
                decoration: KTextDecoration.copyWith(hintText: 'Enter your email',
                ),
                ),
                SizedBox(height: 20.0,),
                TextField(onChanged: (value){
                  pass = value ;
                },
                  textAlign: TextAlign.center,
                  obscureText: true,

          decoration: KTextDecoration,)
                ,SizedBox(height: 20.0,),

                RoundedButton(
               onPressed: ()async{
                 setState(() {
                   showSpinner = true;
                 });
                 try {
                   UserCredential userCredential = await FirebaseAuth
                       .instance
                       .signInWithEmailAndPassword(
                     email: email.trim(),
                     password: pass.trim(),
                   );
                   if (userCredential != null) {
                     Navigator.pushNamed(context, Rest.id);
                   }
                   setState(() {
                     showSpinner = false;
                   });
                 } on FirebaseAuthException catch (e) {
                   if (e.code == 'user-not-found') {
                     setState(() {
                       ScaffoldMessenger.of(context)
                           .showSnackBar(snac('user not found'));
                       showSpinner = false;
                     });
                     print('No user found for that email.');
                   } else if (e.code == 'wrong-password') {
                     setState(() {
                       ScaffoldMessenger.of(context)
                           .showSnackBar(snac('wrong password'));
                       showSpinner = false;
                     });
                     print('Wrong password provided for that user.');
                   }
                 }
               },



                  color: Color(0xFFF44336),
                btnName: 'Log in',),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [TextButton(onPressed: (){
                    Navigator.pushNamed(context, ResetPass.id);
                  }, child: Text(
                    'Forget Password ',
                    style: TextStyle(
                        color: Colors.blueAccent
                    ),
                  ), ),],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
