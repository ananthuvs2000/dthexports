import 'package:dth/screens/standard/production/dayend.dart';
import 'package:dth/screens/standard/production/daystart.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/spacer.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: appBarUnderline,
        title: const Text('Production'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            hSpace(100),
            InkWell(
              onTap: () => Get.to(const DayStart()),
              child: Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300),
                child: Center(
                    child: Text(
                  'DAY START',
                  style: headerText(),
                )),
              ),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => Get.to(const DayEndScreen()),
              child: Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300),
                child: Center(
                    child: Text(
                  'DAY END',
                  style: headerText(),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
