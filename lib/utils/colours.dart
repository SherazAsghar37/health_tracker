import 'package:flutter/material.dart';

abstract class Colours {
  static const Color primaryColor = Color(0xFFE7FE55);
  static const Color secondaryColor = Color(0xFF89FFE3);
  static const Color primaryColorAccent1 = Color(0xFF252824);
  static const Color primaryColorAccent2 = Color(0xFF4A5230);
  static const Color primaryColorAccent3 = Color(0xFF747D38);
  static const Color primaryColorAccent4 = Color(0xFF9BA741);
  static const Color primaryColorAccent5 = Color(0xFFBFD34B);
  static const Color primaryColorAccent6 = Color(0xFFD4E850);
  static const Color backgroundColor = Color(0xFF111111);

  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);

  //TextColors
  static const Color primaryTextColor = Colors.white;
  static const Color primaryTextColorLight = Colors.white54;
  static const Color secondaryTextColor = Colors.black;
  static const Color secondaryTextColorlight = Colors.black54;

  //Cards
  static const Color cardColor = Color(0xFF2A2A2A);
  static const Color lightCardColor = Colors.black12;

  // static const List<Color> detailsColor = [
  //   Colours.primaryColorAccent1,
  //   Colours.primaryColorAccent2,
  //   Colours.primaryColorAccent3,
  //   Colours.primaryColorAccent4,
  //   Colours.primaryColorAccent5,
  //   Colours.primaryColorAccent6,
  // ];
  static const List<Color> detailsColor = [
    Colours.primaryColorAccent6,
    Colours.primaryColorAccent5,
    Colours.primaryColorAccent4,
    Colours.primaryColorAccent3,
    Colours.primaryColorAccent2,
    Colours.primaryColorAccent1,
  ];
}
