import 'package:dth/screens/standard/despach/despach.dart';
import 'package:dth/screens/standard/incoming/acceptpage.dart';
import 'package:dth/screens/standard/incoming/checkpage.dart';
import 'package:dth/screens/standard/outgoing/outgoing.dart';
import 'package:dth/screens/standard/production/productionpage.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/widgets/main_heading.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/sub_dashboard_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen({super.key});

  @override
  State<StandardScreen> createState() => _StandardScreenState();
}

class _StandardScreenState extends State<StandardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Standard',
              style: TextStyles.veryLargeHeading,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2,
              children: [
                SubDashboardItem(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          Center(
                            child: SubDashboardItem(
                                onTap: () {
                                  Get.off(const AcceptPage(), transition: Transition.upToDown);
                                },
                                label: 'ACCEPT'),
                          ),
                          hSpace(10),
                          Center(
                            child: SubDashboardItem(
                                onTap: () {
                                  Get.off(const CheckPage(), transition: Transition.downToUp);
                                },
                                label: 'CHECK'),
                          ),
                        ],
                        title: const Center(child: MainHeading(text: 'Incoming')),
                      ),
                    );
                  },
                  label: 'Incoming',
                ),
                SubDashboardItem(
                  onTap: () {
                    Get.to(const ProductionPage(), transition: Transition.rightToLeft);
                  },
                  label: 'Production',
                ),
                SubDashboardItem(
                  onTap: () {
                    Get.to(const DespachScreen(), transition: Transition.rightToLeft);
                  },
                  label: 'Dispatch',
                ),
                SubDashboardItem(
                  onTap: () {
                    Get.to(const OutGoingScreen(), transition: Transition.rightToLeft);
                  },
                  label: 'Outgoing',
                ),
              ],
            ),
            hSpace(100),
          ],
        ),
      ),
    );
  }
}
