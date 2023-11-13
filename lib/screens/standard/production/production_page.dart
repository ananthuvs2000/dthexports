import 'package:dth/screens/standard/production/production_day_end.dart';
import 'package:dth/screens/standard/production/production_day_start.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_common_widgets/sub_dashboard_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductionPage extends StatefulWidget {
  const ProductionPage({super.key});

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Production',
              style: TextStyles.veryLargeHeading,
            ),
            hSpace(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SubDashboardItem(
                      icon: CupertinoIcons.sun_max_fill,
                      onTap: () {
                        Get.to(
                          const DayStart(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      label: 'Day Start'),
                ),
                wSpace(10),
                Expanded(
                  child: SubDashboardItem(
                      icon: CupertinoIcons.moon_fill,
                      onTap: () {
                        Get.to(
                          const DayEndScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      label: 'Day End'),
                ),
              ],
            ),
            hSpace(50),
          ],
        ),
      ),
    );
  }
}
