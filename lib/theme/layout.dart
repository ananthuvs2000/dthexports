import 'package:flutter/material.dart';

const double appBarTitleImageWidth = 70;

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
    fontSize: 21,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
  );
  static TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0,
    color: Colors.grey.shade800,
  );
}

class DropdownTextStyle {}
