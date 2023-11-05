import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/box_info_display_card.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/team_manager_list.dart';
import 'package:flutter/material.dart';

class RecycleDayStartScreen extends StatefulWidget {
  const RecycleDayStartScreen({super.key});

  @override
  State<RecycleDayStartScreen> createState() => _RecycleDayStartPageState();
}

class _RecycleDayStartPageState extends State<RecycleDayStartScreen> {
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
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 1),
            child: Container(
              color: Colors.black.withOpacity(0.25),
              height: 1,
            ),
          ),
          title: const Text('Recycle Day Start'),
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
                      hSpace(10),
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
                      hSpace(15),
                      DropdownMenuField(
                        controller: TextEditingController(),
                        fieldLabel: 'Box No.',
                        dropDownLabel: 'Select Box',
                        dropdownEntries: const [],
                        onSelected: (selectedVal) {
                          print('');
                        },
                      ),

                      /// Details of Stored Info Of Selected Box
                      hSpace(10),
                      const BoxInfoDisplay(
                        boxNumber: '111',
                        boxType: '111',
                        boxSize: '111',
                        boxWeight: '111',
                      ),
                      // Auto Calculated Field

                      const Divider(),
                      hSpace(5),
                      const DynamicFieldRow(label: 'Material QTY:', value: 'Calculated'),
                      const DynamicFieldRow(label: 'Process:', value: 'Displayed'),

                      //! Worker Team Area
                      TeamManagerWidget(
                        editable: true,
                        teamList: [
                          WorkerData(id: 10, name: 'Arjun'),
                          WorkerData(id: 10, name: 'Arjun'),
                        ],
                      ),

                      hSpace(10),

                      // No. Of Days Counter
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'No. Of Days: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          wSpace(100),
                          IconButton.filled(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                          Expanded(
                            child: DthTextField(
                              controller: TextEditingController(),
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          IconButton.filled(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                        ],
                      ),

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
