import 'package:dth/screens/standard/widgets/image_preview_container.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/bottom_actions_area.dart';
import 'package:dth/widgets/box_info_display.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/number_entry_field.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/team_manager_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DayStart extends StatefulWidget {
  const DayStart({super.key});

  @override
  State<DayStart> createState() => _DayStartState();
}

class _DayStartState extends State<DayStart> {
//! Initializing Image Picker
  XFile? _image;
  late final ImagePicker _picker = ImagePicker();

  final _weightController = TextEditingController();

  //! Picking Image from camera
  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

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
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
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
                  const DynamicFieldRow(
                      label: 'Material Weight', value: 'Calculate Weight&Display'),
                  hSpace(15),
                  TeamManagerWidget(
                    editable: true,
                    teamList: [
                      WorkerData(id: 10, name: 'Athul'),
                      WorkerData(id: 15, name: 'Amal'),
                    ],
                  ),

                  hSpace(15),
                  OpenImageButton(
                    label: 'Take Photo',
                    icon: Icons.camera,
                    onTap: () => getImage(),
                  ),
                  hSpace(15),
                  ImagePreviewBox(
                    image: _image,
                  ),
                  hSpace(15),
                  // Field to Enter Value
                  NumberEntryField(
                    label: 'Enter value shown',
                    controller: TextEditingController(),
                    validator: (value) {
                      return null;
                    },
                  ),
                ],
              ),
            ), // End of listview
            BottomActionsArea(
              children: [
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
