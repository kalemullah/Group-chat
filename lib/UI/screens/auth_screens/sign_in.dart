import 'package:chatsapp/UI/custom_widget/butons.dart';
import 'package:chatsapp/core/constent/colors.dart';
import '../converation.dart';
import '../../custom_widget/costomfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIN extends StatefulWidget {
   SignIN({Key? key}) : super(key: key);


  @override
  _SignINState createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  @override
  String? email;
  String? password;
  String? newPassword;
  final form = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Form(
        key: form,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Image(image: AssetImage('assets/Logo.png')),
                SizedBox(
                  height: 30.h,
                ),
                const Center(
                    child: Text("Let's Get Started ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextField(
                    text: 'E-mail',
                    obscr: false,
                    onSubmmite: (value) {
                      email = value;
                    }),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextField(
                    text: 'password',
                    obscr: true,
                    onSubmmite: (value) {
                      password = value;
                    }),
                SizedBox(
                  height: 30.h,
                ),

                SizedBox(
                  height: 120.h,
                ),
                BottomButton(
                  text: 'log in',
                  color:yellowColor,
                  onPressed: () async {
                    // try {
                    //   final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    //       email: email!,
                    //       password: password!,
                    //   );
                    //   if (user.user !=null){
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const Conversation()));
                    //   }
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'user-not-found') {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('No user found for this email')));
                    //   //  print('No user found for that email.');
                    //   } else if (e.code == 'wrong-password') {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Wrong password provided for that user.')));
                    //   //  print('Wrong password provided for that user.');
                    //   }
                    // }
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Conversation()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


