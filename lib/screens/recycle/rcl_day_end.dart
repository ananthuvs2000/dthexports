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

class RecycleDayEndScreen extends StatefulWidget {
  const RecycleDayEndScreen({super.key});

  @override
  State<RecycleDayEndScreen> createState() => _RecycleDayEndPageState();
}

class _RecycleDayEndPageState extends State<RecycleDayEndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text('Recycle Day End'),
        bottom: appBarUnderline,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
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
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
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
                    hSpace(15),
                    DropdownMenuField(
                      validator: (value) {
                        return '';
                      },
                      fieldLabel: 'Box No.',
                      dropDownLabel: 'Select Box',
                      dropdownEntries: const [
                        DropdownMenuItem(value: '1', child: Text('1')),
                        DropdownMenuItem(value: '2', child: Text('2')),
                        DropdownMenuItem(value: '3', child: Text('3')),
                      ],
                      onSelected: (selectedVal) {},
                    ),

                    /// Details of Stored Info Of Selected Box
                    hSpace(10),
                    const BoxInfoDisplay(
                        boxNumber: '12134', boxType: '25425', boxSize: '235245', boxWeight: '355'),
                    // Auto Calculated Field
                    hSpace(15),
                    const Divider(),
                    hSpace(5),
                    const DynamicFieldRow(label: 'Batch No:', value: 'Displayed'),
                    const DynamicFieldRow(label: 'Output QTY:', value: 'Calculated'),
                    const DynamicFieldRow(label: 'Process:', value: 'Displayed'),
                    const DynamicFieldRow(label: 'Status:', value: 'Displayed'),
                    const DynamicFieldRow(label: 'Wastage:', value: 'Displayed'),
                    const DynamicFieldRow(label: 'Wastage %:', value: 'Calculated %'),
                    // No. Of Days Counter
                    const DynamicFieldRow(label: 'No. Of Days:', value: '0'),
                    //! Worker Team Area
                    hSpace(15),
                    TeamManagerWidget(
                      editable: true,
                      teamList: [
                        WorkerData(id: 10, name: 'Arjun'),
                        WorkerData(id: 10, name: 'Arjun'),
                      ],
                    ),

                    // End of listview
                    hSpace(15),
                  ],
                ),
              ),
              // Main submit button goes here
              hSpace(10),
              SizedBox(
                width: double.infinity,
                child: PrimaryElevatedButton(
                  onPressed: () {},
                  label: 'Post',
                ),
              ),
              hSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
