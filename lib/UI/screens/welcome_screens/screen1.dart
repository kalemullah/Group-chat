import 'dart:math';
import 'package:chatsapp/UI/custom_widget/butons.dart';
import 'package:chatsapp/UI/screens/auth_screens/pre_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatsapp/core/constent/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../auth_screens/register.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  //Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _totalDots = 3;
  double _currentPosition = 0.0;
  List<String> logos = [
    'assets/screen_Logo.png',
    'assets/Logo.png',
    'assets/Logo.png'
  ];
  List<String> mainScreenImages = [
    'assets/screen1_decoration.png',
    'assets/star.png',
    'assets/shield.png'
  ];
  List<String> mainScreenText = [
    ' ',
    'this is dummy text',
    'this is dummy text',
  ];
  List<Color> gradientColors1 = [
    const Color(0xffFDA488),
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF)
  ];
  List<Color> gradientColors2 = [
    const Color(0xffF7C76C),
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF)
  ];

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }

  String getCurrentPositionPretty() {
    return (_currentPosition + 1.0).toStringAsPrecision(2);
  }

  @override
  Widget build(BuildContext context) {
    final decorator = DotsDecorator(
      activeColor: _currentPosition == 0 ? Colors.white : yellowColor,
      //activeColor: Colors.red,
      activeSize: const Size(30, 15),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentPosition = _currentPosition.floorToDouble();
                _updatePosition(min(
                  _currentPosition = index.toDouble(),
                  _totalDots.toDouble(),
                ));
                print('index $index');
                print('current position $_currentPosition');
              });

            },
            itemBuilder: (context, position) {
              return BasicOnboarding(
                image: logos[position],
                color1: gradientColors1[position],
                color2: gradientColors2[position],
                mainscreenimage: mainScreenImages[position],
                text: mainScreenText[position],
              );
            },
            itemCount: 3,
          ),
          _currentPosition==2? Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomButton(text: 'Next', color:yellowColor,buttomcolor: Colors.white,onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const preLogin()));

              }, ),
            ),
          ):
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildRow([
              DotsIndicator(
                dotsCount: _totalDots,
                position: _currentPosition,
                decorator: decorator,
              ),
            ]),
          ),

        ],
      ),
    );
  }
}

class BasicOnboarding extends StatelessWidget {
  final image;
  final mainscreenimage;
  final color1;
  final color2;
  final text;

  BasicOnboarding({this.image, this.color1, this.color2, this.mainscreenimage,this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color1, color2],
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 0,
            child: Image(image: AssetImage(image)),
          ),

          Expanded(
            flex: 3,
            child: Image(image: AssetImage(mainscreenimage)),
          ),
          SizedBox(
            height: 20.h,
          ),
           Expanded(
            flex: 1,
            child: Center(
              child: Text(text),
            ),
          ),

          const Spacer(),

          // Padding(
          //   padding: const EdgeInsets.only(bottom: 50.0),
          //   child: BottomButton(text: 'Next', color:whiteColor,buttomcolor:Colors.black,    onPressed: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
          //
          //   }, ),
          // ),
        ],
      ),
    );
  }
}
