import 'package:flutter/material.dart';

const double appBarTitleImageWidth = 70;
const double formFieldBorderRadius = 10;
const double teamManagerBorderRadius = 10;

class PageLayout {
  static double get pagePaddingX => 20;
}

class TextStyles {
  static TextStyle appBarHeading = const TextStyle(
    fontSize: 20,
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
  static TextStyle dynamicFieldLabelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    color: Colors.grey.shade800,
  );
}
