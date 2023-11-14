import 'package:dth/screens/standard/dispatch/dispatch_page.dart';
import 'package:dth/screens/standard/incoming/batch_selection_page.dart';
import 'package:dth/screens/standard/incoming/check_page.dart';
import 'package:dth/screens/standard/outgoing/outgoing_page.dart';
import 'package:dth/screens/standard/production/accepted_batch_selection.dart';
import 'package:dth/screens/standard/production/production_day_end.dart';
import 'package:dth/screens/standard/production/production_day_start.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
          'assets/images/loginbg.png',
        ),fit: BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: primaryColor,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX+10),
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
                    onTap: () => showModalBottomSheet(
                      constraints: BoxConstraints.tight(const Size.fromHeight(160)),
                      context: context,
                      builder: (context) => BottomSheet(
                        onClosing: () => {},
                        elevation: 0,
                        backgroundColor: Colors.white,
                        builder: (context) => incomingModalSheet(
                          destination1: const CheckPage(),
                          destination2: const AccepedBatchSelectionPage(),
                        ),
                      ),
                    ),
                    label: 'Incoming',
                  ),
                  SubDashboardItem(
                    icon: CupertinoIcons.hammer_fill,
                    onTap: () => showModalBottomSheet(
                      constraints: BoxConstraints.tight(const Size.fromHeight(160)),
                      context: context,
                      builder: (context) => BottomSheet(
                        onClosing: () => {},
                        elevation: 0,
                        backgroundColor: Colors.white,
                        builder: (context) => productionModal(
                          destination1: const BatchSelectionPage(),
                          destination2: const DayEndScreen(),
                        ),
                      ),
                    ),
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
                      Get.to(const OutGoingScreen(), transition: Transition.rightToLeftWithFade,duration: Duration(microseconds: 500));
                    },
                    label: 'Outgoing',
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

incomingModalSheet({
  required Widget destination1,
  required Widget destination2,
}) =>
    Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: SubDashboardItem(
                      onTap: () => Get.to(() => destination1, transition: Transition.downToUp),
                      label: 'Checking',
                      icon: Icons.search)),
              wSpace(10),
              Expanded(
                  child: SubDashboardItem(
                      onTap: () => Get.to(() => destination2, transition: Transition.downToUp),
                      label: 'Accepting',
                      icon: Icons.check)),
            ],
          ),
        ],
      ),
    );

productionModal({
  required Widget destination1,
  required Widget destination2,
}) =>
    Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: SubDashboardItem(
                      onTap: () => Get.to(() => destination1, transition: Transition.downToUp),
                      label: 'Day Start',
                      icon: Icons.sunny)),
              wSpace(10),
              Expanded(
                  child: SubDashboardItem(
                      onTap: () => Get.to(() => destination2, transition: Transition.downToUp),
                      label: 'Day End',
                      icon: Icons.nightlight_round)),
            ],
          ),
        ],
      ),
    );
