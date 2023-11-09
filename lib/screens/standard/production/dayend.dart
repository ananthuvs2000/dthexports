import 'package:dth/screens/standard/widgets/table.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/box_info_display.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/secondary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class DayEndScreen extends StatefulWidget {
  const DayEndScreen({super.key});

  @override
  State<DayEndScreen> createState() => _DayEndScreenState();
}

class _DayEndScreenState extends State<DayEndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                style: TextStyle(fontWeight: FontWeight.bold, height: 1),
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
                      validator: (value) {
                        return '';
                      },
                      fieldLabel: 'Box No:',
                      dropDownLabel: 'Select Box',
                      dropdownEntries: const [
                        DropdownMenuItem(value: '1', child: Text('1')),
                        DropdownMenuItem(value: '2', child: Text('2')),
                        DropdownMenuItem(value: '3', child: Text('3')),
                      ],
                      onSelected: (selectedVal) {
                        print(selectedVal.toString());
                      },
                    ),
                    hSpace(15),
                    const BoxInfoDisplay(
                        boxNumber: 'No.', boxType: 'Type', boxSize: 'Size', boxWeight: 'Weight'),
                    const SizedBox(
                      height: 20,
                    ),
                    const DynamicFieldRow(
                        label: 'Material Weight', value: 'Calculate Weight&Display'),
                    const SizedBox(
                      height: 10,
                    ),
                    hSpace(10),
                    SecondaryElevatedButton(onPressed: () {
                      
                    }, label: 'PRS Completed'),
                   
                    
                    hSpace(10),
                    SecondaryElevatedButton(onPressed: () {
                      
                    }, label: 'Balance'),
                    const SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //         alignment: Alignment.centerRight,
                    //         height: 80,
                    //         width: 160,
                    //         decoration: BoxDecoration(
                    //             border: Border.all(color: Colors.black),
                    //             borderRadius: BorderRadius.circular(10)),
                    //         child: Text('TOTAL PRS WASTAGE%', style: labelText())),
                    //     Container(
                    //         padding: const EdgeInsets.all(5),
                    //         alignment: Alignment.center,
                    //         height: 80,
                    //         width: 160,
                    //         decoration: BoxDecoration(
                    //             border: Border.all(color: Colors.black),
                    //             borderRadius: BorderRadius.circular(10)),
                    //         child: Text('AUTO CALC TOTAL % WASTAGE', style: labelText())),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    DynamicFieldRow(label: 'Total Process Wastage', value: 'Auto Calc Total% Wastage'),
                    hSpace(10),
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
    );
  }
}
