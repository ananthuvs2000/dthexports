import 'package:dth/screens/recycle/rcl_day_end.dart';
import 'package:dth/screens/recycle/rcl_day_start.dart';
import 'package:dth/screens/recycle/rcladd.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/sub_dashboard_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecyclePage extends StatefulWidget {
  const RecyclePage({super.key});

  @override
  State<RecyclePage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<RecyclePage> {
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
          title: const Text('RECYCLE'),
        ),
        //
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PageLayout.pagePaddingX,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubDashboardItem(
                    onTap: () {
                      Get.to(
                        const RecycleAddScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    label: 'RCL-ADD'),
                hSpace(15),
                SubDashboardItem(
                    onTap: () {
                      Get.to(
                        const RecycleDayStartScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    label: 'RCL-DAY START'),
                hSpace(15),
                SubDashboardItem(
                  onTap: () {
                    Get.to(
                      const RecycleDayEndScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  label: 'RCL-DAY END',
                ),
                hSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
