import 'package:dth/screens/login_page.dart';
import 'package:dth/screens/recycle/recycle_page.dart';
import 'package:dth/screens/reports/reports_page.dart';
import 'package:dth/screens/standard/standard_page.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/dashboard_option_container.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/cupertino.dart';
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/loginbg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX + 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/appbar.jpg',
                  height: 50.h,
                  fit: BoxFit.fitHeight,
                ),
                hSpace(50),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.5,
                  children: [
                    DashboardOptionContainer(
                      gradient: dashboardOptionGrad3,
                      shadowColor: primaryColor,
                      icon: CupertinoIcons.building_2_fill,
                      text: 'Standard',
                      onTap: () {
                        Get.to(
                          const StandardScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    DashboardOptionContainer(
                      gradient: dashboardOptionGrad2,
                      shadowColor: Colors.green,
                      icon: Icons.recycling_outlined,
                      text: 'Recycle',
                      onTap: () {
                        Get.to(
                          const RecyclePage(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    DashboardOptionContainer(
                      gradient: primaryButtonGradient,
                      shadowColor: Colors.indigo,
                      icon: CupertinoIcons.doc_chart_fill,
                      text: 'Reports',
                      onTap: () {
                        Get.to(
                          const ReportsPage(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    DashboardOptionContainer(
                      gradient: dashboardOptionGrad1,
                      shadowColor: Colors.deepOrange,
                      icon: CupertinoIcons.arrow_right_to_line_alt,
                      text: 'Log Out',
                      onTap: () {
                        Get.offAll(LoginPg());
                      },
                    ),
                  ],
                ),
                hSpace(60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
