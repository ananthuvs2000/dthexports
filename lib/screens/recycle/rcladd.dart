import 'package:dth/screens/recycle/widgets/rclboxdrill.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class RecycleAddScreen extends StatefulWidget {
  const RecycleAddScreen({super.key});

  @override
  State<RecycleAddScreen> createState() => _RecycleAddScreenState();
}

class _RecycleAddScreenState extends State<RecycleAddScreen> {
  final TextEditingController _weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/bg.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Recycle Add'),
          bottom: appBarUnderline,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    hSpace(20),
                    const DynamicFieldRow(label: 'Batch No.', value: 'AUTO_GENERATED'),
                    const SizedBox(
                      height: 20,
                    ),

                    // Photo And Weight Entry
                    Row(
                      children: [
                        OpenCameraButton(
                          label: 'Take Photo',
                          onTap: () {},
                        ),
                        wSpace(40),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Enter Value As Shown \nIn Machine',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                              DthTextField(
                                hintText: 'XX.XXX KG',
                                controller: _weightController,
                                validator: (value) {
                                  return '';
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    hSpace(10),
                    const Divider(),
                    hSpace(10),
                    DropdownMenuField(
                      controller: TextEditingController(),
                      fieldLabel: 'Box No.',
                      dropDownLabel: 'Select Box',
                      dropdownEntries: const [],
                      onSelected: (selectedVal) {},
                    ),
                    hSpace(15),
                    const DynamicFieldRow(
                      label: 'Material QTY',
                      value: 'CALCULATED',
                    ),
                    hSpace(25),
                    const DynamicFieldRow(
                      label: 'State',
                      value: 'TO_RECYCLE',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: PrimaryElevatedButton(
                  label: 'POST',
                  onPressed: () {},
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
