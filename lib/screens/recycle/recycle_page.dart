import 'package:dth/screens/recycle/rcl_day_end_page.dart';
import 'package:dth/screens/recycle/rcl_day_start_page.dart';
import 'package:dth/screens/recycle/rcl_add_page.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_common_widgets/sub_dashboard_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecyclePage extends StatefulWidget {
  const RecyclePage({super.key});

  @override
  State<RecyclePage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<RecyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: inversePrimaryColor,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PageLayout.pagePaddingX + 20,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recycle',
                style: TextStyles.veryLargeHeading,
              ),
              hSpace(10),
              SubDashboardItem(
                  icon: CupertinoIcons.add,
                  onTap: () {
                    Get.to(
                      const RecycleAddScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  label: 'RCL-ADD'),
              hSpace(15),
              SubDashboardItem(
                  icon: Icons.recycling,
                  onTap: () {
                    Get.to(
                      const RecycleDayStartScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  label: 'RCL-DAY START'),
              hSpace(15),
              SubDashboardItem(
                icon: Icons.recycling,
                onTap: () {
                  Get.to(
                    const RecycleDayEndScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                label: 'RCL-DAY END',
              ),
              hSpace(75),
            ],
          ),
        ),
      ),
    );
  }
}
