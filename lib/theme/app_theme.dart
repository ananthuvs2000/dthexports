import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

//& DROP DOWN MENU
DropdownMenuThemeData dropdownMenuThemeData = DropdownMenuThemeData(
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black.withOpacity(0.25),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black.withOpacity(0.5),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: primaryColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: formFieldErrorColor,
      ),
    ),
    hintStyle: const TextStyle(fontSize: 12),
    labelStyle: const TextStyle(fontSize: 12),
  ),
  menuStyle: MenuStyle(
    alignment: Alignment.bottomLeft,
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        side: BorderSide(color: Colors.black.withOpacity(0.5)),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    padding: const MaterialStatePropertyAll(EdgeInsets.zero),
    elevation: const MaterialStatePropertyAll(0),
    backgroundColor: const MaterialStatePropertyAll(Colors.white),
  ),
  textStyle: const TextStyle(
    fontSize: 12,
  ),
);

// Final ThemeData Variable
ThemeData dthAppThem = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  appBarTheme: dthAppbarTheme,
  dropdownMenuTheme: dropdownMenuThemeData,
);
