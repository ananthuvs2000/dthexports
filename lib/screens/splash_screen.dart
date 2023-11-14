import 'package:dth/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(LoginPg(), transition: Transition.rightToLeft);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/appbar.jpg',
          fit: BoxFit.contain,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
