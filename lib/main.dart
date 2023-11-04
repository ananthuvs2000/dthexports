import 'package:dth/screens/splashscreen.dart';
import 'package:dth/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DTS Exports LLP',
      theme: dthAppThem,
      home: const SplashScreen(),
    );
  }
}
