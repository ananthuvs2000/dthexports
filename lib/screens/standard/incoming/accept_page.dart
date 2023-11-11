import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_services/item_accept_temp.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
// import 'package:dth/widgets/date_time_display.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/dynamic_field_row.dart';
import 'package:dth/_common_widgets/number_entry_field.dart';
import 'package:dth/_common_widgets/open_camera_button.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/secondary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AcceptPage extends StatefulWidget {
  const AcceptPage({
    required this.batchCode,
    super.key,
  });

  final String batchCode;
  @override
  State<AcceptPage> createState() => _AcceptPageState();
}

class _AcceptPageState extends State<AcceptPage> {
  final TextEditingController _quantityController = TextEditingController();

  final _acceptFormKey = GlobalKey<FormState>();

  //! Initializing Image Picker
  XFile? _image;
  late final ImagePicker _picker = ImagePicker();

  //! Picking Image from camera
  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<int> numsOneTo99 = List.generate(99, (index) => index + 1);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Accept'),
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: appBarUnderline,
      ),
      body: Form(
        key: _acceptFormKey,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
                  shrinkWrap: true,
                  children: [
                    hSpace(15),
                    DynamicFieldRow(label: 'Batch Code', value: widget.batchCode),
                    hSpace(15),
                    DropdownMenuField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a value';
                        } else {
                          return null;
                        }
                      },
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
                        if (value == null) {
                          return 'Please select a value';
                        } else {
                          return null;
                        }
                      },
                      fieldLabel: 'Size:',
                      dropDownLabel: 'Select Size',
                      dropdownEntries: const [
                        DropdownMenuItem(value: '13-15', child: Text('13"-15"')),
                        DropdownMenuItem(value: '15-19"', child: Text('15"-19"')),
                      ],
                      onSelected: (selectedVal) {
                        print(selectedVal.toString());
                      },
                    ),
                    hSpace(15),
                    DropdownMenuField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a value';
                        } else {
                          return null;
                        }
                      },
                      fieldLabel: 'Color:',
                      dropDownLabel: 'Select Color',
                      dropdownEntries: const [
                        DropdownMenuItem(value: 'RED', child: Text('Red')),
                        DropdownMenuItem(value: 'BLACK', child: Text('Black')),
                      ],
                      onSelected: (selectedVal) {
                        print(selectedVal.toString());
                      },
                    ),
                    hSpace(15),
                    DropdownMenuField(
                      validator: (value) {
                        if (value == null) {
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
                      onSelected: (value) {
                        print(value.toString());
                      },
                    ),
                    hSpace(15),
                    const DynamicFieldRow(label: 'Process', value: 'RAW MATERIAL'),
                    hSpace(15),
                    NumberEntryField(
                      label: 'Material Qty',
                      controller: _quantityController,
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter a value';
                        } else {
                          return null;
                        }
                      },
                    ),
                    (_image != null) ? ImagePreviewBox(image: _image) : hSpace(15),
                    //! ^ IMAGE PREVIEW AREA
                    OpenImageButton(
                      icon: Icons.camera,
                      label: 'Take Photo',
                      onTap: () {
                        getImage();
                      },
                    ),
                    hSpace(30),
                  ],
                ),
              ),
              // Bottom Actions Area For Add / Submit
              BottomActionsArea(
                children: [
                  SecondaryElevatedButton(
                    icon: Icons.add,
                    onPressed: () async {
                      if (_acceptFormKey.currentState!.validate()) {
                        print('Form valid');
                        if (_image != null) {
                          //Showing success message
                          // Get.snackbar('Added Succesfully', 'message');

                          await ItemAcceptTempData().postTempData();
                          // Clearing all fields and dropdowns
                          setState(() => _image = null);
                          _quantityController.clear();
                          _acceptFormKey.currentState!.reset();
                        }
                      } else {
                        print('Form invalid');
                      }
                    },
                    label: 'Add More',
                  ),
                  wSpace(10),
                  Expanded(
                    child: PrimaryElevatedButton(
                      onPressed: () {},
                      label: 'Submit',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
