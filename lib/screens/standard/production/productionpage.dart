import 'package:dth/screens/standard/production/dayend.dart';
import 'package:dth/screens/standard/production/daystart.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductionPage extends StatefulWidget {
  const ProductionPage({super.key});

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: appBarUnderline,
          title: const Text('Production'),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      color: Colors.teal.shade100),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('dd-MM-yyyy').format(DateTime.now()),
                          style: labelText(),
                        ),
                        Text(
                          DateFormat.jm().format(DateTime.now()),
                          style: labelText(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
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
          )
        ]),
      ),
    );
  }
}
