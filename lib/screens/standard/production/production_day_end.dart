import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/screens/standard/widgets/table.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
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
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DayEndScreen extends StatefulWidget {
  const DayEndScreen({
    required this.batchCode,
    super.key,
  });
  final String batchCode;
  @override
  State<DayEndScreen> createState() => _DayEndScreenState();
}

class _DayEndScreenState extends State<DayEndScreen> {
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

  final TextEditingController _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.inversePrimaryColor,
          title: const Text('Production Day End'),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
              child: Column(
                children: [
                  hSpace(15),
                  DropdownMenuField(
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please select a box';
                      }
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
                    label: 'Enter weight as shown',
                    controller: _weightController,
                    validator: (value) {
                      return null;
                    },
                  ),
                  hSpace(15),

                  //  BoxInfoDisplay(
                  //   box: ,
                  // ),
                  hSpace(15),
                  const DynamicFieldRow(label: 'Material Weight', value: 'CALCULATED'),
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
      ),
    );
  }
}
