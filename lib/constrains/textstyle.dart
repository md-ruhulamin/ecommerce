import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
TextStyle customTextStyle({
   Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  FontStyle? fontStyle,
  TextDecoration? decoration,
  TextDecorationStyle? decorationStyle,
  double? letterSpacing,
  double? wordSpacing,
}) {
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: decorationStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
  );
}
