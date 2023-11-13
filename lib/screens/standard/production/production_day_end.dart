import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_providers/dropdown_providers/accept_page_form_provider.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/_providers/item_accept_temp_provider.dart';
import 'package:dth/screens/standard/widgets/table.dart';
import 'package:dth/theme/colors.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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

  late CameraProvider _imageProvider;
  late AcceptPageDropDownProvider _dropDownProvider;

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
        backgroundColor: primaryColor,
        foregroundColor: inversePrimaryColor,
        title: const Text('Production Day End'),
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
                // OpenImageButton(
                //   width: double.infinity,
                //   icon: Icons.camera,
                //   label: 'Take Photo',
                //   onTap: () => getImage(),
                // ),
                // hSpace(10),
                // ImagePreviewBox(
                //   image: _image,
                // ),
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
                  title: 'Box Details',
                  boxColor: 'No.',
                  boxTexture: 'Type',
                  boxSize: 'Size',
                  boxWeight: 'Weight',
                ),
                hSpace(15),
                const DynamicFieldRow(label: 'Material Weight', value: 'CALCULATED'),
                hSpace(15),
                SecondaryElevatedButton(onPressed: () {}, label: 'Balance'),
                hSpace(15),
                const DynamicFieldRow(label: 'Total Process Wastage', value: 'CALCULATED'),
                hSpace(15),
                const TableWidget(),
                hSpace(15), // end of listview
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomActionsArea(
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
    );
  }
}
