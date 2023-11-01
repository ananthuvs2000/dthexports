import 'package:dth/screens/standardpage.dart';
import 'package:dth/widgets/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: Image.asset(
                  'assets/images/appbar.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap:()=> Get.to(StandardScreen()),
              child: Customcontainer(text: 'STANDARD', colors: Colors.red.shade500)),
            Customcontainer(text: 'RECYCLE', colors: Colors.yellow.shade700),
            Customcontainer(text: 'REPORTS', colors: Colors.indigo),
          ],
        )
      ]),
    );
  }
}
