import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final double appBarTitleImageWidth = 70.w;
const double formFieldBorderRadius = 10;
const double teamManagerBorderRadius = 10;
const double dashboardItemBorderRadius = 10;

class PageLayout {
  static double get pagePaddingX => 20.w;
}

class TextStyles {
  static TextStyle appBarHeading = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );
  static TextStyle mainHeadingStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
  );
  static TextStyle labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle dynamicFieldLabelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    color: Colors.black,
  );
}
