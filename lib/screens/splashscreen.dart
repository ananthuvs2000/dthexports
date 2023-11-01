import 'package:dth/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
    Future.delayed(const Duration(seconds: 1),() {
      Get.to(LoginPg());
    },);
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
        child: Image.asset('assets/images/loginpage.jpg',fit: BoxFit.fill,),
      ),
    );
  }
}