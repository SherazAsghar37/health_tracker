import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_tracker/utils/colours.dart';

abstract class Utils {
  static TextStyle getStyle({
    fontSize = 16,
    color = Colours.primaryTextColor,
    fontWeight = FontWeight.normal,
    textAlign = TextAlign.start,
    letterSpacing = 0,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontFamily: 'Causten',
    );
  }

  static Widget svgIcon(
    String path, {
    double size = 24,
    Color color = Colours.primaryTextColor,
  }) {
    return SvgPicture.asset(path, height: size, width: size, color: color);
  }
}
