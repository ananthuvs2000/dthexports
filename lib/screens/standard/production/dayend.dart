import 'package:dth/screens/standard/widgets/table.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/bottom_actions_area.dart';
import 'package:dth/widgets/box_info_display.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/number_entry_field.dart';
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
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      hSpace(15),
                      OpenImageButton(
                        width: double.infinity,
                        icon: Icons.camera,
                        label: 'Take Photo',
                        onTap: () {},
                      ),
                      hSpace(10),
                      // Field to Enter Value
                      NumberEntryField(
                        label: 'Enter weight\nas shown',
                        controller: TextEditingController(),
                        validator: (value) {
                          return null;
                        },
                      ),
                      hSpace(10),
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
                      hSpace(20),
                      const DynamicFieldRow(label: 'Material Weight', value: 'CALCULATED'),
                      hSpace(20),
                      SecondaryElevatedButton(onPressed: () {}, label: 'Balance'),
                      hSpace(20),
                      const DynamicFieldRow(label: 'Total Process Wastage', value: 'CALCULATED'),
                      hSpace(10),
                      const TableWidget(),
                      hSpace(20),
                    ],
                  ),
                ],
              ),
            ), // end of listview
            BottomActionsArea(
              children: [
                SecondaryElevatedButton(
                  onPressed: () {},
                  label: 'PRS Completed',
                ),
                wSpace(10),
                Expanded(
                  child: PrimaryElevatedButton(
                    onPressed: () {},
                    label: 'Submit',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
