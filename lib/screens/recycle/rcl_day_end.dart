import 'package:dth/screens/standard/widgets/image_preview_container.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
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

class RecycleDayEndScreen extends StatefulWidget {
  const RecycleDayEndScreen({super.key});

  @override
  State<RecycleDayEndScreen> createState() => _RecycleDayEndPageState();
}

class _RecycleDayEndPageState extends State<RecycleDayEndScreen> {
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
        title: const Text('Recycle Day End'),
        bottom: appBarUnderline,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
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

                    hSpace(15),
                    DropdownMenuField(
                      validator: (value) {
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

                    /// Details of Stored Info Of Selected Box
                    hSpace(15),
                    const BoxInfoDisplay(
                      boxNumber: '12134',
                      boxType: '25425',
                      boxSize: '235245',
                      boxWeight: '355',
                    ),
                    // Auto Calculated Field
                    hSpace(15),

                    SizedBox(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const DynamicFieldRow(label: 'Batch No:', value: 'Displayed'),
                          const DynamicFieldRow(label: 'Output QTY:', value: 'Calculated'),
                          const DynamicFieldRow(label: 'Process:', value: 'Displayed'),
                          const DynamicFieldRow(label: 'Status:', value: 'Displayed'),
                          const DynamicFieldRow(label: 'Wastage:', value: 'Displayed'),
                          const DynamicFieldRow(label: 'Wastage %:', value: 'Calculated %'),
                        ],
                      ),
                    ),
                    // No. Of Days Counter
                    const DynamicFieldRow(label: 'No. Of Days:', value: '0'),
                    //! Worker Team Area
                    hSpace(15),
                    TeamManagerWidget(
                      editable: true,
                      teamList: [
                        WorkerData(id: 10, name: 'Arjun'),
                        WorkerData(id: 10, name: 'Arjun'),
                      ],
                    ),

                    // End of listview
                    hSpace(15),
                  ],
                ),
              ),
              // Main submit button goes here
              hSpace(10),
              SizedBox(
                width: double.infinity,
                child: PrimaryElevatedButton(
                  onPressed: () {},
                  label: 'Post',
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
