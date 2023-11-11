import 'package:dth/_utilites/scaffold_snackbars.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/dynamic_field_row.dart';
import 'package:dth/_common_widgets/number_entry_field.dart';
import 'package:dth/_common_widgets/open_camera_button.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecycleAddScreen extends StatefulWidget {
  const RecycleAddScreen({super.key});

  @override
  State<RecycleAddScreen> createState() => _RecycleAddScreenState();
}

class _RecycleAddScreenState extends State<RecycleAddScreen> {
  final TextEditingController _weightController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Recycle Add'),
        bottom: appBarUnderline,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
                shrinkWrap: true,
                children: [
                  hSpace(15),
                  const DynamicFieldRow(label: 'Batch No.', value: 'AUTO'),
                  hSpace(15),

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

                  hSpace(10),
                  const Divider(),
                  hSpace(10),
                  DropdownMenuField(
                    /* 
                    ^Once posted the box sent for recycle must not appear in this dropdown
                     */
                    validator: (value) {
                      if (value == '') {
                        return 'Please select a value';
                      }
                      return null;
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
                  hSpace(15),
                  const DynamicFieldRow(
                    //^ Show material quantity of that box?
                    label: 'Material QTY',
                    value: 'CALCULATED',
                  ),
                  hSpace(25),
                  const DynamicFieldRow(
                    label: 'State',
                    value: 'TO RECYCLE',
                  ),
                ],
              ),
            ),
            BottomActionsArea(children: [
              Expanded(child: PrimaryElevatedButton(onPressed: () {}, label: 'Post')),
            ]),
          ],
        ),
      ),
    );
  }
}
