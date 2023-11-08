import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/teamdrilldown.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/box_info_display_card.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/team_manager_list.dart';
import 'package:flutter/material.dart';

class DayStart extends StatefulWidget {
  const DayStart({super.key});

  @override
  State<DayStart> createState() => _DayStartState();
}

class _DayStartState extends State<DayStart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/bg.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Production Day Start'),
          bottom: appBarUnderline,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  hSpace(20),
                  const DynamicFieldRow(
                      label: 'Batch No:', value: 'Display Batch No'),
                  const SizedBox(
                    height: 20,
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
                  hSpace(15),
                  
                  BoxInfoDisplay(
                      boxNumber: 'No.',
                      boxType: 'Type',
                      boxSize: 'Size',
                      boxWeight: 'Weight'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Process:  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade700,
                            )),
                        child: Text(
                          'Display Process',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Team',
                    dropDownLabel: 'Select Team',
                    dropdownEntries: const [
                      DropdownMenuEntry(value: 'Team 1', label: 'Team 1'),
                      DropdownMenuEntry(value: 'Team 2', label: 'Team 2'),
                      DropdownMenuEntry(value: 'Team 3', label: 'Team 3'),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Material Weight',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Calculate Wt. & Display',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  hSpace(15),
                   TeamManagerWidget(
                        editable: true,
                        teamList: [
                          WorkerData(id: 10, name: 'Athul'),
                          WorkerData(id: 15, name: 'Amal'),
                        ],
                      ),
                  hSpace(40),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: PrimaryElevatedButton(
                          onPressed: () {}, label: 'SUBMIT'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
