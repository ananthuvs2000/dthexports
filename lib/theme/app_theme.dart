import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const mainFont = 'Instrument';

AppBarTheme dthAppbarTheme = AppBarTheme(
  toolbarHeight: 60.h,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  backgroundColor: Colors.transparent,
  centerTitle: true,
  titleTextStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: mainFont,
    fontSize: 20,
  ),
);

//& DROP DOWN MENU
DropdownMenuThemeData dropdownMenuThemeData = DropdownMenuThemeData(
  inputDecorationTheme: InputDecorationTheme(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.1),
      ),
    ),
    focusColor: Colors.red,
    isDense: true,
    // contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black.withOpacity(0.25),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black.withOpacity(0.5),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      borderSide: BorderSide(
        width: 1,
        color: primaryColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: formFieldErrorColor,
      ),
    ),
    hintStyle: const TextStyle(fontSize: 12),
    labelStyle: const TextStyle(fontSize: 12),
  ),
  menuStyle: MenuStyle(
    visualDensity: VisualDensity.compact,
    alignment: Alignment.bottomLeft,
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black.withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(globalBorderRadius),
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
ThemeData dthAppTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: mainFont,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  appBarTheme: dthAppbarTheme,
  dropdownMenuTheme: dropdownMenuThemeData,
);
