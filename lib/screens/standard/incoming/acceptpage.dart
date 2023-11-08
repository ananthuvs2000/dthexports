// import 'package:dth/screens/standard/widgets/camera.dart';
import 'package:dth/screens/standard/widgets/camera.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/date_time_display.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/number_entry_field.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptPage extends StatefulWidget {
  const AcceptPage({super.key});

  @override
  State<AcceptPage> createState() => _AcceptPageState();
}

class _AcceptPageState extends State<AcceptPage> {
  double? boxweight;
  final String date = DateTime.now().toString();
  final String time = '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Accept'),
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: appBarUnderline,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
                shrinkWrap: true,
                children: [
                  hSpace(15),
                  DateTimeDisplay(
                    date: date,
                    time: time,
                  ),
                  hSpace(15),
                  DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Box No:',
                    dropDownLabel: 'Select Box ',
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
                  DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Size:',
                    dropDownLabel: 'Select Size',
                    dropdownEntries: const [
                      DropdownMenuEntry(value: '32', label: '32'),
                      DropdownMenuEntry(value: '40', label: '40'),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                  DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Color:',
                    dropDownLabel: 'Select Color',
                    dropdownEntries: const [
                      DropdownMenuEntry(value: 'RED', label: 'RED'),
                      DropdownMenuEntry(value: 'BlACK', label: 'BlACK'),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                  DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Texture:',
                    dropDownLabel: 'Select Texture',
                    dropdownEntries: const [],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                  const DynamicFieldRow(label: 'Process', value: 'RAW MATERIAL'),
                  hSpace(25),
                  NumberEntryField(
                    label: 'Material Qty',
                    controller: _quantityController,
                    validator: (value) {
                      return '';
                    },
                  ),
                  hSpace(35),
                  OpenCameraButton(
                    label: 'Open Camera',
                    onTap: () {
                      Get.to(CameraScreen());
                    },
                  ),
                  hSpace(20),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Add More +',
                        style: TextStyle(fontSize: 16),
                      )),
                  hSpace(30),
                ],
              ),
            ),
            // Submit Button
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: PageLayout.pagePaddingX,
                vertical: 5,
              ),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.25),
                ),
              ]),
              width: double.infinity,
              child: PrimaryElevatedButton(onPressed: () {}, label: 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
