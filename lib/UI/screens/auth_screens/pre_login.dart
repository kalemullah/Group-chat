import 'package:chatsapp/UI/custom_widget/butons.dart';
import 'package:chatsapp/UI/screens/auth_screens/register.dart';
import 'package:chatsapp/UI/screens/auth_screens/sign_in.dart';
import 'package:chatsapp/core/constent/colors.dart';
import '../converation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class preLogin extends StatefulWidget {
  const preLogin({Key? key}) : super(key: key);

  @override
  _preLoginState createState() => _preLoginState();
}

class _preLoginState extends State<preLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body:  SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                const Image(image: AssetImage('assets/Logo.png')),
                SizedBox(
                  height: 30.h,
                ),

                SizedBox(
                  height: 70.h,
                ),

                SizedBox(
                  height: 30.h,
                ),
                BottomButton(
                  text: 'register',
                  color: yellowColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register()));
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                BottomButton(
                  text: 'Sign in',
                  color: yellowColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIN()));
                  },
                ),
                SizedBox(
                  height: 120.h,
                ),

              ],
            ),
          ),
        ),

    );
  }
}



