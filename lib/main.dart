import 'package:dth/_providers/checking_provider.dart';
import 'package:dth/_providers/datetime_provider.dart';
import 'package:dth/_providers/dropdown_providers/accept_page_form_provider.dart';
import 'package:dth/_providers/employee_provider.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/_providers/item_accept_temp_provider.dart';
import 'package:dth/_providers/itemcheck_provider.dart';
import 'package:dth/_providers/team_provider.dart';
import 'package:dth/_providers/vendor_provider.dart';
import 'package:dth/screens/splash_screen.dart';
import 'package:dth/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CameraProvider()),
        ChangeNotifierProvider(create: (context) => VendorProvider()),
        ChangeNotifierProvider(create: (context) => CheckingProvider()),
        ChangeNotifierProvider(create: (context) => TeamProvider()),
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
        ChangeNotifierProvider(create: (context) => ItemCheckProvider()),
        ChangeNotifierProvider(create: (context) => ItemAcceptTempProvider()),
        ChangeNotifierProvider(create: (context) => DateTimeProvider()),

        //^ DropDownProviders
        ChangeNotifierProvider(create: (context) => AcceptPageDropDownProvider()),
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
