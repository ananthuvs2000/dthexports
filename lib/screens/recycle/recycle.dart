import 'package:dth/screens/recycle/rcl_day_end.dart';
import 'package:dth/screens/recycle/rcl_day_start.dart';
import 'package:dth/screens/recycle/rcladd.dart';

import 'package:dth/widgets/arrowback.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/spacer.dart';
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
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2, top: 25),
                  child: ArrowBack(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'RECYCLE',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //  Container(
                //     height: 80,
                //     decoration: BoxDecoration(
                //       // borderRadius: BorderRadius.circular(20),
                //       color: Colors.teal.shade100
                //     ),
                //     child: Center(
                //       child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text(DateFormat('dd-MM-yyyy').format(DateTime.now()),style: labelText(),),
                //           Text(DateFormat.jm().format(DateTime.now()),style: labelText(),),
                //         ],
                //       ),
                //     ),
                //   ),
                SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () => Get.to(RecycleAddScreen()),
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300),
                    child: Center(
                        child: Text(
                      'RCL ADD',
                      style: headerText(),
                    )),
                  ),
                ),
                hSpace(25),
                InkWell(
                  onTap: () => Get.to(
                    const RecycleDayStartScreen(),
                    transition: Transition.rightToLeft,
                  ),
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300),
                    child: Center(
                        child: Text(
                      'RCL-DAY START',
                      style: headerText(),
                    )),
                  ),
                ),
                hSpace(25),
                InkWell(
                  onTap: () => Get.to(
                    const RecycleDayEndScreen(),
                    transition: Transition.rightToLeft,
                  ),
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300),
                    child: Center(
                        child: Text(
                      'RCL-DAY END',
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
