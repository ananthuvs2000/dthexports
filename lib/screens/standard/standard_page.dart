import 'package:dth/screens/standard/dispatch/dispatch_page.dart';
import 'package:dth/screens/standard/incoming/accept_page.dart';
// import 'package:dth/screens/standard/incoming/acceptpage.dart';
import 'package:dth/screens/standard/incoming/batch_selection_page.dart';
import 'package:dth/screens/standard/incoming/check_page.dart';
import 'package:dth/screens/standard/outgoing/outgoing_page.dart';
import 'package:dth/screens/standard/production/production_page.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/_common_widgets/main_heading.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_common_widgets/sub_dashboard_option.dart';
import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
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
              childAspectRatio: 1.5,
              children: [
                SubDashboardItem(
                  icon: CupertinoIcons.down_arrow,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          Center(
                            child: SubDashboardItem(
                              icon: CupertinoIcons.check_mark,
                              onTap: () {
                                Get.off(
                                  const BatchSelectionPage(),
                                  transition: Transition.upToDown,
                                );
                              },
                              label: 'ACCEPT',
                            ),
                          ),
                          hSpace(10),
                          Center(
                            child: SubDashboardItem(
                              icon: CupertinoIcons.search_circle_fill,
                              onTap: () {
                                Get.off(const CheckPage(), transition: Transition.downToUp);
                              },
                              label: 'CHECK',
                            ),
                          ),
                        ],
                        title: const Center(child: MainHeading(text: 'Incoming')),
                      ),
                    );
                  },
                  label: 'Incoming',
                ),
                SubDashboardItem(
                  icon: CupertinoIcons.hammer_fill,
                  onTap: () {
                    Get.to(const ProductionPage(), transition: Transition.rightToLeft);
                  },
                  label: 'Production',
                ),
                SubDashboardItem(
                  icon: Icons.fire_truck,
                  onTap: () {
                    Get.to(const DespachScreen(), transition: Transition.rightToLeft);
                  },
                  label: 'Dispatch',
                ),
                SubDashboardItem(
                  icon: CupertinoIcons.up_arrow,
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
