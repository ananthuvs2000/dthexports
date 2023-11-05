import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Recycle Day End'),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 1),
            child: Container(
              height: 1,
              color: Colors.black.withOpacity(0.25),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      hSpace(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OpenCameraButton(
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
                        controller: TextEditingController(),
                        fieldLabel: 'Box No.',
                        dropDownLabel: 'Select Box',
                        dropdownEntries: const [],
                        onSelected: (selectedVal) {},
                      ),

                      /// Details of Stored Info Of Selected Box
                      hSpace(10),
                      Container(
                        padding: const EdgeInsets.all(30),
                        color: Colors.red,
                        width: double.infinity,
                        height: 100,
                      ),
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
                      hSpace(10),
                      //! Worker Team Area
                      TeamManagerWidget(
                        editable: true,
                        teamList: [
                          WorkerData(id: 10, name: 'Arjun'),
                          WorkerData(id: 10, name: 'Arjun'),
                        ],
                      ),

                      hSpace(15),
                      // No. Of Days Counter
                      const DynamicFieldRow(label: 'No. Of Days:', value: '0'),
                      // End of listview
                      hSpace(15),
                    ],
                  ),
                ),
                // Main submit button goes here
                hSpace(2.5),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryElevatedButton(
                    onPressed: () {},
                    label: 'Post',
                  ),
                ),
                hSpace(5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}