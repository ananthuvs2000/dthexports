import 'package:dth/_providers/image_provider.dart';
import 'package:dth/_utilites/scaffold_snackbars.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/dynamic_field_row.dart';
import 'package:dth/_common_widgets/weight_entry_field.dart';
import 'package:dth/_common_widgets/open_camera_button.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RecycleAddScreen extends StatefulWidget {
  const RecycleAddScreen({super.key});

  @override
  State<RecycleAddScreen> createState() => _RecycleAddScreenState();
}

class _RecycleAddScreenState extends State<RecycleAddScreen> {
  final TextEditingController _weightController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text('Recycle Add'),
        bottom: appBarUnderline,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              hSpace(15),
              const DynamicFieldRow(label: 'Batch No.', value: 'AUTO'),
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
      ),
      bottomNavigationBar: BottomActionsArea(children: [
        Expanded(
            child: PrimaryElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(errorSnackbar('Invalid Submission'));
                  }
                },
                label: 'Post')),
      ]),
    );
  }
}
