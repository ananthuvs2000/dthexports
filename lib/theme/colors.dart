import 'package:flutter/material.dart';

class AppColors {
  static Color get primaryColor => const Color.fromRGBO(70, 20, 203, 1);
  static Color get secondaryColor => const Color.fromRGBO(100, 103, 250, 1);
  static Color get inversePrimaryColor => Colors.white;

// Form Colors
  static Color get formFieldErrorColor => const Color.fromARGB(255, 222, 50, 80);
  static Color get formFieldHintColor => Colors.black.withOpacity(0.3);
  static Color get formFieldPrefixIconColor => Colors.black.withOpacity(0.5);
  static Color get formFieldEnabledBorderColor => Colors.black.withOpacity(0.5);
  static Color get formFieldFocusedBorderColor => primaryColor;
}

class AppGradients {
  static LinearGradient get dashboardOptionGrad1 => LinearGradient(
        colors: [
          Colors.red.shade600,
          Colors.deepOrange.shade400,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get dashboardOptionGrad2 => LinearGradient(
        colors: [
          Colors.teal.shade600,
          Colors.green.shade500,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get dashboardOptionGrad3 => LinearGradient(
        colors: [
          Colors.deepPurple,
          Colors.purple.shade500,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get dashboardOptionGrad4 => const LinearGradient(
        colors: [],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      );

  static LinearGradient get subDashboardOptionGrad => LinearGradient(
        colors: [
          Colors.deepPurple.shade500,
          Colors.deepPurple.shade400,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      );

  static LinearGradient get primaryButtonGradient => LinearGradient(
        colors: [
          AppColors.primaryColor,
          AppColors.secondaryColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
      );
}
