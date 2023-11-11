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

class RecycleDayStartScreen extends StatefulWidget {
  const RecycleDayStartScreen({super.key});

  @override
  State<RecycleDayStartScreen> createState() => _RecycleDayStartPageState();
}

class _RecycleDayStartPageState extends State<RecycleDayStartScreen> {
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
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: appBarUnderline,
        title: const Text('Recycle Day Start'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
                shrinkWrap: true,
                children: [
                  hSpace(10),
                  // Photo And Weight Entry
                  OpenImageButton(
                    label: 'Take Photo',
                    icon: Icons.camera_alt,
                    onTap: () => getImage(),
                  ),
                  hSpace(10),
                  ImagePreviewBox(image: _image),
                  hSpace(10),

                  NumberEntryField(
                    label: 'Enter value as shown',
                    controller: _weightController,
                    validator: (value) {
                      if (value == '') {
                        return 'Error';
                      }
                      return null;
                    },
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
                  hSpace(15),
                  const BoxInfoDisplay(
                    boxNumber: '111',
                    boxType: '111',
                    boxSize: '111',
                    boxWeight: '111',
                  ),
                  // Auto Calculated Field

                  hSpace(15),
                  const DynamicFieldRow(label: 'Material QTY:', value: 'Calculated'),
                  hSpace(15),
                  const DynamicFieldRow(label: 'Process:', value: 'Displayed'),

                  //! Worker Team Area'
                  hSpace(15),
                  TeamManagerWidget(
                    editable: true,
                    teamList: [
                      WorkerData(id: 10, name: 'Arjun'),
                      WorkerData(id: 10, name: 'Arjun'),
                    ],
                  ),

                  hSpace(15),

                  // No. Of Days Counter
                  const DynamicFieldRow(label: 'No of days', value: '1'),

                  // End of listview
                  hSpace(15),
                ],
              ),
            ),
            // Main submit button goes here
            BottomActionsArea(children: [
              Expanded(
                child: PrimaryElevatedButton(
                  label: 'Post',
                  onPressed: () {},
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
