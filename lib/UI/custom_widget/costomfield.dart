import 'package:chatsapp/core/constent/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextField extends StatelessWidget {
  final String text;
  bool? obscr;
  var onSubmmite;

  CustomTextField({required this.text, this.obscr, this.onSubmmite});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: 320.w,
      height: 50.h,
      child: TextField(
        cursorColor: blackColor,
        onChanged: onSubmmite,
        obscureText: obscr!,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          hintText: text,
          hintStyle: const TextStyle(
            color: blackColor,
          ),
          contentPadding: EdgeInsets.only(left: 30.w),
        ),
      ),
    );
  }
}