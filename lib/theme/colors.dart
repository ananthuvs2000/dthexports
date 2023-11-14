import 'package:flutter/material.dart';

final Color primaryColor = Color.fromRGBO(70, 20, 203, 1);
final Color secondaryColor = Color.fromRGBO(141, 103, 250, 1);
const Color inversePrimaryColor = Colors.white;

// Form Styles
const Color formFieldErrorColor = Color.fromARGB(255, 222, 50, 80);
final Color formFieldHintColor = Colors.black.withOpacity(0.3);
final Color formFieldPrefixIconColor = Colors.black.withOpacity(0.5);
final Color formFieldEnabledBorderColor = Colors.black.withOpacity(0.5);
final Color formFieldFocusedBorderColor = primaryColor;

//? Gradients
//Dashboard
LinearGradient dashboardOptionGrad1 = LinearGradient(
  colors: [
    Colors.deepOrange.shade400,
    Colors.red.shade600,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient dashboardOptionGrad2 = LinearGradient(
  colors: [
    Colors.green.shade500,
    Colors.teal.shade600,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
);
LinearGradient dashboardOptionGrad3 = const LinearGradient(
  colors: [
    Colors.purple,
    Colors.deepPurple,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
);
LinearGradient dashboardOptionGrad4 = const LinearGradient(
  colors: [],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
);

//
LinearGradient subDashboardOptionGrad = LinearGradient(
  colors: [
    Colors.grey.shade700,
    const Color.fromRGBO(50, 50, 50, 1),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
);

// Primary
LinearGradient primaryButtonGradient = LinearGradient(
  colors: [
    secondaryColor,
    primaryColor,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomRight,
);
