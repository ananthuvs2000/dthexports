import 'package:dth/screens/login_page.dart';
import 'package:dth/screens/recycle/recycle.dart';
import 'package:dth/screens/reports/reports_page.dart';
import 'package:dth/screens/standard/standardpage.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/dashboard_option_container.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SafeArea(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: Center(
                  child: Image.asset(
                    'assets/images/appbar.jpg',
                    height: 100.h,
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
                  hSpace(50),
                  DashboardOptionContainer(
                    color: primaryColor,
                    icon: Icons.factory_outlined,
                    text: 'Standard',
                    onTap: () {
                      Get.to(
                        const StandardScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                  hSpace(15),
                  DashboardOptionContainer(
                    color: Colors.teal,
                    icon: Icons.recycling_outlined,
                    text: 'Recycle',
                    onTap: () {
                      Get.to(
                        const RecyclePage(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                  hSpace(15),
                  DashboardOptionContainer(
                    color: Colors.pink,
                    icon: Icons.list_alt_sharp,
                    text: 'Reports',
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
                    text: 'Log Out',
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
    );
  }
}
