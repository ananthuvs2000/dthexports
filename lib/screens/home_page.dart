import 'package:dth/screens/login_page.dart';
import 'package:dth/screens/recycle/recycle.dart';
import 'package:dth/screens/reports/reports_page.dart';
import 'package:dth/screens/standard/standardpage.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/dashboard_option_container.dart';
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
      height: 100,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Image.asset(
                      'assets/images/appbar.jpg',
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    hSpace(10),
                    hSpace(15),
                    DashboardOptionContainer(
                      color: primaryColor,
                      icon: Icons.factory_outlined,
                      text: 'STANDARD',
                      onTap: () {
                        Get.to(
                          const StandardScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    hSpace(15),
                    DashboardOptionContainer(
                      color: Colors.green,
                      icon: Icons.recycling_outlined,
                      text: 'RECYCLE',
                      onTap: () {
                        Get.to(
                          const RecyclePage(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    hSpace(15),
                    DashboardOptionContainer(
                      color: Colors.deepOrange,
                      icon: Icons.list_alt_sharp,
                      text: 'REPORTS',
                      onTap: () {
                        Get.to(
                          const ReportsPage(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    hSpace(15),
                    DashboardOptionContainer(
                      color: Colors.grey.shade800,
                      icon: Icons.logout,
                      text: 'LOG OUT',
                      onTap: () {
                        Get.offAll(LoginPg());
                      },
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
