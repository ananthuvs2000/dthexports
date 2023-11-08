import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/table.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/box_info_display_card.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayEndScreen extends StatefulWidget {
  const DayEndScreen({super.key});

  @override
  State<DayEndScreen> createState() => _DayEndScreenState();
}

class _DayEndScreenState extends State<DayEndScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Production Day End'),
          bottom: appBarUnderline,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX - 5),
              child: Column(
                children: [
                  Column(
                    children: [
                      hSpace(15),
                       Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OpenCameraButton(
                        label: 'Take Photo',
                        onTap: () {},
                      ),
                      wSpace(20),
                      // Field to Enter Value
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Enter Value Shown',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, height: 1),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                            hSpace(5),
                            DthTextField(
                              hintText: 'XX.XXX KG',
                              controller: TextEditingController(),
                              validator: (value) {
                                return null;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                     DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Box No:',
                    dropDownLabel: 'Select Box',
                    dropdownEntries: const [
                      DropdownMenuEntry(value: '1', label: '1'),
                      DropdownMenuEntry(value: '2', label: '2'),
                      DropdownMenuEntry(value: '3', label: '3'),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  // hSpace(15),
                      // Container(
                      //     padding: const EdgeInsets.all(6),
                      //     alignment: Alignment.center,
                      //     height: 60,
                      //     width: MediaQuery.sizeOf(context).width,
                      //     decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black54),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: Text('DISPLAY THE BASIC STORED INFO OF THAT BOX “DAY START"',
                      //         style: labelText())),
                      hSpace(15),
                  
                  BoxInfoDisplay(
                      boxNumber: 'No.',
                      boxType: 'Type',
                      boxSize: 'Size',
                      boxWeight: 'Weight'),
                  
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Process:  ',
                            style: headerText(),
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Display Process', style: labelText())),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red.shade800),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Get.snackbar('OPEN CAMERA', '', snackPosition: SnackPosition.BOTTOM);
                            },
                            child: const Text(
                              "PRS. COMPLETED",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('APPLY FORMULA', style: labelText())),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red.shade800),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "BALANCE:",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('APPLY FORMULA', style: labelText())),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.centerRight,
                              height: 80,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('TOTAL PRS WASTAGE%', style: labelText())),
                          Container(
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: 80,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('AUTO CALC TOTAL % WASTAGE', style: labelText())),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TableWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  hSpace(10),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryElevatedButton(onPressed: () {}, label: "SUBMIT"),
                  ),
                  hSpace(10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
