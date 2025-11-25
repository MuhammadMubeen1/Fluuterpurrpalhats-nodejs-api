import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle appTextStyle({double? fontSize, FontWeight? fontWeight, FontStyle? fontStyle, Color? color}) {
    return TextStyle(
      fontFamily: "Muli",
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
    );
  }
}
