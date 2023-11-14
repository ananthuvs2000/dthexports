import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Global sizes
const double formFieldBorderRadius = globalBorderRadius;
const double teamManagerBorderRadius = globalBorderRadius;
const double dashboardItemBorderRadius = globalBorderRadius;

const double globalBorderRadius = 20;

class PageLayout {
  static double get pagePaddingX => 20.w;
}

class DashboardOptionSizes {
  static EdgeInsetsGeometry mainOptionsPadding = const EdgeInsets.all(15);
  static EdgeInsetsGeometry subOptionsPadding = const EdgeInsets.all(10);
}
