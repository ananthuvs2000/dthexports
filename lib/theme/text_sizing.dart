import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  // Appbar and headings
  static TextStyle appBarHeading = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );

  static TextStyle veryLargeHeading =  TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.1,
    color: Colors.deepPurple
  );

  static TextStyle mainHeadingStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );

  // Labels and plain text
  static TextStyle labelStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static TextStyle dynamicFieldLabelStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    color: Colors.black,
  );

  // Text Button style
  static TextStyle textButtonLabelStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
}
