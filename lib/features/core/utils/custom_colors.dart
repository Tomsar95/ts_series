import 'package:flutter/material.dart';

class CustomColors {
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color softBlack = Color(0xFF191919);
  static const Color yellow = Color(0xFFFFD233);
  static const Color lightGray = Color(0xFFf1f2f3);
  static const Color darkGray = Color(0xFF8C8C8C);
  static const Color darkerGray = Colors.black12;

  static const Gradient backGroundGradient =  LinearGradient(
    colors: [CustomColors.softBlack, CustomColors.darkerGray],
    stops: [0.5,1],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}