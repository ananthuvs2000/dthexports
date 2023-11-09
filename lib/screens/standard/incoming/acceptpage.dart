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
  const AcceptPage({
    super.key,
    this.path,
  });
  final String? path;

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
    final List<int> numsOneTo99 = List.generate(99, (index) => index + 1);

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
                    validator: (value) {
                      if (value == '') {
                        return 'Please select a value';
                      } else {
                        return null;
                      }
                    },
                    defaultValue: '1',
                    fieldLabel: 'Box No:',
                    dropDownLabel: 'Select Box ',
                    dropdownEntries: numsOneTo99
                        .map((num) => DropdownMenuItem(
                              value: '$num',
                              child: Text(num.toString()),
                            ))
                        .toList(),
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                  DropdownMenuField(
                    validator: (value) {
                      if (value == '') {
                        return 'Please select a value';
                      } else {
                        return null;
                      }
                    },
                    fieldLabel: 'Size:',
                    dropDownLabel: 'Select Size',
                    dropdownEntries: const [
                      DropdownMenuItem(value: '13"', child: Text('1')),
                      DropdownMenuItem(value: '15"', child: Text('2')),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                  DropdownMenuField(
                    validator: (value) {
                      if (value == '') {
                        return 'Please select a value';
                      } else {
                        return null;
                      }
                    },
                    fieldLabel: 'Color:',
                    dropDownLabel: 'Select Color',
                    dropdownEntries: const [
                      DropdownMenuItem(value: 'RED', child: Text('Red')),
                      DropdownMenuItem(value: 'Black', child: Text('Black')),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                  DropdownMenuField(
                    validator: (value) {
                      if (value == '') {
                        return 'Please select a value';
                      } else {
                        return null;
                      }
                    },
                    fieldLabel: 'Texture:',
                    dropDownLabel: 'Select Texture',
                    dropdownEntries: const [
                      DropdownMenuItem(value: 'WAVY', child: Text('WAVY')),
                      DropdownMenuItem(value: 'SUPER STRAIGHT', child: Text('SUPER STRAIGHT')),
                    ],
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
                      if (value == '') {
                        return 'Please select a value';
                      } else {
                        return null;
                      }
                    },
                  ),
                  hSpace(35),
                  OpenCameraButton(
                    label: 'Open Camera',
                    onTap: () {
                      // Get.to(const CameraScreen());
                      showDialog(
                        context: context,
                        builder: (context) => CameraScreen(),
                      );
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
              child: PrimaryElevatedButton(
                onPressed: () {
                  Get.snackbar('Picture taken', widget.path.toString());
                },
                label: 'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
