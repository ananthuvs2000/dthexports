import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/screens/standard/widgets/table.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/box_info_display.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/dynamic_field_row.dart';
import 'package:dth/_common_widgets/number_entry_field.dart';
import 'package:dth/_common_widgets/open_camera_button.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/secondary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DayEndScreen extends StatefulWidget {
  const DayEndScreen({super.key});

  @override
  State<DayEndScreen> createState() => _DayEndScreenState();
}

class _DayEndScreenState extends State<DayEndScreen> {
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
                  hSpace(15),
                  DropdownMenuField(
                    validator: (value) {
                      return null;
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
                  OpenImageButton(
                    width: double.infinity,
                    icon: Icons.camera,
                    label: 'Take Photo',
                    onTap: () => getImage(),
                  ),
                  hSpace(10),
                  ImagePreviewBox(
                    image: _image,
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
                  hSpace(15),

                  const BoxInfoDisplay(
                      boxNumber: 'No.', boxType: 'Type', boxSize: 'Size', boxWeight: 'Weight'),
                  hSpace(15),
                  const DynamicFieldRow(label: 'Material Weight', value: 'CALCULATED'),
                  hSpace(15),
                  SecondaryElevatedButton(onPressed: () {}, label: 'Balance'),
                  hSpace(15),
                  const DynamicFieldRow(label: 'Total Process Wastage', value: 'CALCULATED'),
                  hSpace(15),
                  const TableWidget(),
                  hSpace(15),
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