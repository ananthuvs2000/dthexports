import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  // Appbar and headings
  static TextStyle get appBarHeading => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      );

  static TextStyle get veryLargeHeading => TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.1,
        height: 0,
        color: Colors.deepPurple.shade700,
      );

  static TextStyle get mainHeadingStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        height: 0,
      );

  // Labels and plain text
  static TextStyle get labelStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get dynamicFieldLabelStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: Colors.black,
      );

  // Text Button style
  static TextStyle get textButtonLabelStyle => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
}
