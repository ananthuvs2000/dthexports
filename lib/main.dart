import 'package:dth/screens/splash_screen.dart';
// import 'package:dth/screens/standard/incoming/checking/datetime_provider.dart';
import 'package:dth/screens/standard/incoming/checking/vendor_provider.dart';
import 'package:dth/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VendorProvider()),
        // ChangeNotifierProvider(create: (context) => DateTimeProvider()),
      ],
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DTS Exports LLP',
        theme: dthAppThem,
        home: const SplashScreen(),
      ),
    );
  }
}
