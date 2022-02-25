import 'package:flutter/material.dart';
class BottomButton extends StatelessWidget {
  const BottomButton({required this.text,this.onPressed,this.color,this.buttomcolor });
  final  String text;
  final  onPressed;
  final color;
  final buttomcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 45,
          width: 280,
          decoration:  BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
                Radius.circular(20.0)),
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(text,style: TextStyle(color:buttomcolor,fontSize: 20,fontWeight: FontWeight.w500),),
          )),


        )

    );
  }
}