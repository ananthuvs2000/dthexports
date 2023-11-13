import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/box_info_display.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/dynamic_field_row.dart';
import 'package:dth/_common_widgets/number_entry_field.dart';
import 'package:dth/_common_widgets/open_camera_button.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_common_widgets/team_manager_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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

  late CameraProvider _imageProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageProvider = Provider.of<CameraProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.delayed(Duration.zero, () {
      _imageProvider.clearImage();
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
            child: Column(
              children: [
                hSpace(15),
                // Photo And Weight Entry
                // OpenImageButton(
                //   label: 'Take Photo',
                //   icon: Icons.camera_alt,
                //   onTap: () => getImage(),
                // ),
                // hSpace(10),
                // ImagePreviewBox(image: _image),
                Consumer<CameraProvider>(
                  builder: (context, state, _) {
                    if (_imageProvider.image == null) {
                      return const SizedBox();
                    } else {
                      return ImagePreviewBox(image: _imageProvider.image);
                    }
                  },
                ),
                OpenImageButton(
                  width: double.infinity,
                  icon: CupertinoIcons.camera_fill,
                  label: (Provider.of<CameraProvider>(context).image == null)
                      ? 'Take Photo'
                      : 'Take Again',
                  onTap: () async {
                    await _imageProvider.getImage();
                  },
                ),

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
                  title: 'Box Details',
                  boxColor: '12134',
                  boxTexture: '25425',
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
                // Main submit button goes here
                hSpace(10),

                hSpace(10),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomActionsArea(children: [
        Expanded(
          child: PrimaryElevatedButton(
            label: 'Post',
            onPressed: () {},
          ),
        )
      ]),
    );
  }
}
