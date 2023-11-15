import 'package:flutter/material.dart';

class AppColors {
  static Color get primaryColor => Color.fromRGBO(70, 20, 203, 1);
  static Color get secondaryColor => Color.fromRGBO(100, 103, 250, 1);
  static Color get inversePrimaryColor => Colors.white;

// Form Styles
  static Color get formFieldErrorColor => Color.fromARGB(255, 222, 50, 80);
  static Color get formFieldHintColor => Colors.black.withOpacity(0.3);
  static Color get formFieldPrefixIconColor => Colors.black.withOpacity(0.5);
  static Color get formFieldEnabledBorderColor => Colors.black.withOpacity(0.5);
  static Color get formFieldFocusedBorderColor => primaryColor;
}

class AppGradients {
  //? Gradients
  static LinearGradient get dashboardOptionGrad1 => LinearGradient(
        colors: [
          Colors.deepOrange.shade400,
          Colors.red.shade600,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get dashboardOptionGrad2 => LinearGradient(
        colors: [
          Colors.green.shade500,
          Colors.teal.shade600,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get dashboardOptionGrad3 => const LinearGradient(
        colors: [
          Colors.purple,
          Colors.deepPurple,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get dashboardOptionGrad4 => const LinearGradient(
        colors: [],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      );

//
  static LinearGradient get subDashboardOptionGrad => LinearGradient(
        colors: [
          Colors.deepPurple.shade500,
          Colors.deepPurple.shade400,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      );

// Primary
  static LinearGradient get primaryButtonGradient => LinearGradient(
        colors: [
          AppColors.secondaryColor,
          AppColors.primaryColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
      );
}
