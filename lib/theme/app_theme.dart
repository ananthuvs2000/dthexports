import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Colors

// Themes
AppBarTheme dthAppbarTheme = const AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  backgroundColor: Colors.transparent,
  centerTitle: true,
  titleTextStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Poppins',
    fontSize: 22,
    letterSpacing: -1,
  ),
);

ThemeData dthAppThem = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Poppins',
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  appBarTheme: dthAppbarTheme,
);
