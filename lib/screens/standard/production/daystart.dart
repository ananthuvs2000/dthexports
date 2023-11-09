import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/box_info_display.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
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
    return Scaffold(
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
                const DynamicFieldRow(label: 'Batch No:', value: 'Display Batch No'),
                hSpace(15),
                DropdownMenuField(
                  validator: (value) {
                    return '';
                  },
                  fieldLabel: 'Box No:',
                  dropDownLabel: 'Select Box',
                  dropdownEntries: const [
                    DropdownMenuItem(value: '1', child: Text('1')),
                    DropdownMenuItem(value: '2', child: Text('2')),
                    DropdownMenuItem(
                      value: '3',
                      child: Text('3'),
                    )
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(15),
                const BoxInfoDisplay(
                    boxNumber: 'No.', boxType: 'Type', boxSize: 'Size', boxWeight: 'Weight'),
                const SizedBox(height: 20),
                const DynamicFieldRow(label: 'Process', value: 'Display Process'),
                hSpace(15),
                DropdownMenuField(
                  validator: (value) {
                    return '';
                  },
                  fieldLabel: 'Team',
                  dropDownLabel: 'Select Team',
                  dropdownEntries: const [
                    DropdownMenuItem(value: 'Team 1', child: Text('Team 1')),
                    DropdownMenuItem(value: 'Team 2', child: Text('Team 2')),
                    DropdownMenuItem(value: 'Team 3', child: Text('Team 3')),
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OpenImageButton(
                      label: 'Take Photo',
                      icon: Icons.camera,
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
                const SizedBox(
                  height: 10,
                ),
                const DynamicFieldRow(label: 'Material Weight', value: 'Calculate Weight&Display'),
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
                    child: PrimaryElevatedButton(onPressed: () {}, label: 'SUBMIT'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
