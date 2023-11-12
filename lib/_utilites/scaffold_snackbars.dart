import 'package:flutter/material.dart';

const EdgeInsetsGeometry _padding = EdgeInsets.symmetric(horizontal: 15, vertical: 5);
const Duration _duration = Duration(seconds: 2);
const _margin = EdgeInsets.all(10);
const BorderRadius _borderRadius = BorderRadius.all(Radius.circular(10));

SnackBar errorSnackbar(String message) {
  return SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    margin: _margin,
    showCloseIcon: true,
    closeIconColor: Colors.white,
    duration: _duration,
    shape: const RoundedRectangleBorder(
      borderRadius: _borderRadius,
    ),
    padding: _padding,
    backgroundColor: Colors.red.shade500,
    content: Text(
      message,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
  );
}

SnackBar successSnackbar(String message) {
  return SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    margin: _margin,
    showCloseIcon: true,
    closeIconColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: _borderRadius,
    ),
    padding: _padding,
    backgroundColor: Colors.teal,
    content: Text(
      message,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
  );
}
