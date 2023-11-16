import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  // Appbar and headings
  static TextStyle get appBarHeading => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      );

  static TextStyle get veryLargeHeading => TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.1,
        height: 0,
        color: Colors.deepPurple.shade700,
      );

  static TextStyle get mainHeadingStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      );

  // Labels and plain text
  static TextStyle get labelStyle => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get dynamicFieldLabelStyle => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: Colors.black,
      );

  // Text Button style
  static TextStyle get textButtonLabelStyle => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
      );
}
