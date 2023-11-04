import 'package:dth/screens/standard/production/dayend.dart';
import 'package:dth/screens/standard/production/daystart.dart';
import 'package:dth/widgets/arrowback.dart';
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
      decoration: BoxDecoration(
     image: DecorationImage(image: AssetImage('assets/images/bg.jpg'),fit: BoxFit.cover)
    ),
      child: Scaffold(
       backgroundColor: Colors.transparent,
        body: Stack(
          children:[ Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2,top: 25),
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
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('PRODUCTION',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                 Container(
                    height: 80,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      color: Colors.teal.shade100
                    ),
                    child: Center(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(DateFormat('dd-MM-yyyy').format(DateTime.now()),style: labelText(),),
                          Text(DateFormat.jm().format(DateTime.now()),style: labelText(),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100,),
                  InkWell(
                    onTap: () => Get.to(DayStart()),
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                       
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300
                      ),
                      child: Center(child: Text('DAY START',style: headerText(),)),
                    ),
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () => Get.to(DayEndScreen()),
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                       
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300
                      ),
                      child: Center(child: Text('DAY END',style: headerText(),)),
                    ),
                  ),
              ],
            ),
          )
          ]
        ),
      ),
    );
  }
}