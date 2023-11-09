import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const mainFont = 'Instrument';

AppBarTheme dthAppbarTheme = AppBarTheme(
  toolbarHeight: 50.sp,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  centerTitle: true,
  titleTextStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: mainFont,
    fontSize: 20,
  ),
);

InputDecorationTheme inputTheme = InputDecorationTheme(
  prefixIconColor: MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.focused)) {
      return primaryColor;
    } else {
      return Colors.black.withOpacity(0.1);
    }
  }),
);

// Final ThemeData Variable
ThemeData dthAppTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: mainFont,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  appBarTheme: dthAppbarTheme,
  inputDecorationTheme: inputTheme,
);
