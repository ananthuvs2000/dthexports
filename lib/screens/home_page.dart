import 'package:dth/screens/recycle/recycle.dart';
import 'package:dth/screens/reports/reports_page.dart';
import 'package:dth/screens/standard/standardpage.dart';
import 'package:dth/widgets/customcontainer.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            PrimaryElevatedButton(
              onPressed: () {},
              label: 'Log Out',
            ),
            wSpace(10),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () =>
                          Get.to(const StandardScreen(), transition: Transition.rightToLeft),
                      child: Customcontainer(text: 'STANDARD', colors: Colors.red.shade500)),
                  InkWell(
                      onTap: () => Get.to(const RecyclePage(), transition: Transition.rightToLeft),
                      child: Customcontainer(text: 'RECYCLE', colors: Colors.yellow.shade700)),
                  InkWell(
                    onTap: () => Get.to(const ReportsPage(), transition: Transition.rightToLeft),
                    child: Customcontainer(
                      text: 'REPORTS',
                      colors: Colors.indigo,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
