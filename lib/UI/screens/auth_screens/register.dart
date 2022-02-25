import 'package:chatsapp/UI/custom_widget/butons.dart';
import 'package:chatsapp/UI/screens/chat/chat_screen.dart';
import 'package:chatsapp/core/constent/colors.dart';
import '../converation.dart';
import '../../custom_widget/costomfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? email;
  String? password;
  String? newPassword;
  final _form = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Form(
        key: _form,
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
                CustomTextField(
                    text: 'confirm password',
                    obscr: true,
                    onSubmmite: (value) {
                      newPassword = value;
                    }),
                SizedBox(
                  height: 120.h,
                ),
                BottomButton(
                  text: 'register',
                    color:yellowColor,
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ChatScreen(email!)));
                        // if(password==newPassword){
                        //   final user = await _auth.createUserWithEmailAndPassword(
                        //       email: email!, password: password!);
                        //   if (user.user != null) {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => const Conversation()));
                        //   }
                        //   print('$email   $password--------------');
                        // }
                        // else{
                        //   const _snackBar = SnackBar(
                        //       content: Text('password not match')
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                        // }

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

// class BottomButton extends StatelessWidget {
//   final Text;
//   final ontap;
//
//   BottomButton({this.Text, this.ontap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 50),
//       child: GestureDetector(
//           onTap: ontap,
//            onTap: () async {
//            if(password==newPassword){
//              final user = await _auth.createUserWithEmailAndPassword(
//                  email: email!, password: password!);
//              if (user.user != null) {
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => const Conversation()));
//              }
//              print('$email   $password--------------');
//           }
//            else{
//              final _snackBar = SnackBar(
//                  content: Text('password not match')
//              );
//              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
//            }
//           },
//           child: Container(
//             height: 45,
//             width: 280,
//             decoration: BoxDecoration(
//               color: Colors.yellow[700],
//               borderRadius: const BorderRadius.all(Radius.circular(20.0)),
//             ),
//             child: Center(
//                 child: Padding(
//               padding: EdgeInsets.all(0.0),
//               child: Text(
//                 Text,
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             )),
//           )),
//     );
//   }
// }
