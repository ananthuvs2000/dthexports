import 'package:dth/screens/standard/production/dayend.dart';
import 'package:dth/screens/standard/production/daystart.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/sub_dashboard_option.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(),
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
            SubDashboardItem(
                onTap: () {
                  Get.to(
                    const DayStart(),
                    transition: Transition.rightToLeft,
                  );
                },
                label: 'Day Start'),
            hSpace(15),
            SubDashboardItem(
                onTap: () {
                  Get.to(
                    const DayEndScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                label: 'Day End'),
            hSpace(50),
          ],
        ),
      ),
    );
  }
}
