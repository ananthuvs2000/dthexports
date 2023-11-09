import 'package:dth/screens/login_page.dart';
import 'package:dth/screens/recycle/recycle.dart';
import 'package:dth/screens/reports/reports_page.dart';
import 'package:dth/screens/standard/standardpage.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/appbar.jpg',
                  height: 75.h,
                  fit: BoxFit.fitHeight,
                ),
              ),
              hSpace(25),
              Text(
                'Dashboard',
                style: TextStyles.veryLargeHeading,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5,
                children: [
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
              hSpace(100),
            ],
          ),
        ),
      ),
    );
  }
}
