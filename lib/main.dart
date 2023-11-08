// import 'package:dth/_providers/datetime_provider.dart';
import 'package:dth/_providers/team_provider.dart';
import 'package:dth/_providers/vendor_provider.dart';
import 'package:dth/screens/splash_screen.dart';
import 'package:dth/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        ChangeNotifierProvider(create: (context) => TeamProvider()),
        // ChangeNotifierProvider(create: (context) => DateTimeProvider()),
      ],
      builder: (context, child) => ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(400, 800),
        minTextAdapt: true,
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DTS Exports LLP',
          theme: dthAppTheme,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
