import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_providers/dropdown_providers/accept_page_form_provider.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/_services/image_upload_service.dart';
import 'package:dth/_services/item_accept_temp_service.dart';
import 'package:dth/_utilites/scaffold_snackbars.dart';
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
import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late CameraProvider _imageProvider;
  late AcceptPageDropDownProvider _dropDownProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageProvider = Provider.of<CameraProvider>(context, listen: false);
    _dropDownProvider = Provider.of<AcceptPageDropDownProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.delayed(Duration.zero, () {
      _imageProvider.clearImage();
      _dropDownProvider.clearDropdowns();
    });
  }

// Controllers and form key
  final TextEditingController _quantityController = TextEditingController();
  final _acceptFormKey = GlobalKey<FormState>();

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
      body: Consumer<AcceptPageDropDownProvider>(
        builder: (context, dropdownState, _) => Form(
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

                      // Consumer to get remaining box nums from temp api
                      DropdownMenuField(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a value';
                          } else {
                            return null;
                          }
                        },
                        fieldLabel: 'Box No',
                        dropDownLabel: 'Select Box ',
                        dropdownEntries: numsOneTo99
                            .map((number) => DropdownMenuItem(
                                  value: '$number',
                                  child: Text(number.toString()),
                                ))
                            .toList(),
                        onSelected: (selectedVal) {
                          dropdownState.updateBoxNumber = selectedVal;
                          print(dropdownState.box);
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
                        defaultValue: '1',
                        dropdownEntries: const [
                          DropdownMenuItem(value: '1', child: Text('13"-15"')),
                          DropdownMenuItem(value: '2', child: Text('15"-19"')),
                          DropdownMenuItem(value: '3', child: Text('19"-23"')),
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
                        defaultValue: '1',
                        dropdownEntries: const [
                          DropdownMenuItem(value: '1', child: Text('Red')),
                          DropdownMenuItem(value: '2', child: Text('Black')),
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
                        defaultValue: '1',
                        dropdownEntries: const [
                          DropdownMenuItem(value: '1', child: Text('WAVY')),
                          DropdownMenuItem(value: '2', child: Text('SUPER STRAIGHT')),
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
                      hSpace(15),
                      //! ^ IMAGE PREVIEW AREA
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
                        icon: CupertinoIcons.camera_fill,
                        label: (Provider.of<CameraProvider>(context).image == null)
                            ? 'Take Photo'
                            : 'Take Again',
                        onTap: () async {
                          await _imageProvider.getImage();
                        },
                      ),
                      hSpace(25),

                      //? Consumer for boxes in accepted batch here
                      Text(
                        'Boxes added to this batch',
                        style: TextStyles.mainHeadingStyle,
                      ),
                      //! Builder for added boxes of this batch
                      ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (false) {
                          } else {
                            return const Text('No Boxes');
                          }
                        },
                      ),
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
                          if (_imageProvider.image != null) {
                            //Showing success message
                            // Get.snackbar('Added Succesfully', 'message');
                            final imageUploadRes =
                                await ImageUploadService().uploadImage(_imageProvider.image!.path);
                            if (imageUploadRes.imagePath != '') {
                              await ItemAcceptTempService().postTempData(
                                batchCode: widget.batchCode,
                                boxRef: "2",
                                colorRef: "2",
                                sizeRef: "2",
                                materialQty: _quantityController.text,
                                imagePath: imageUploadRes.imagePath,
                              );

                              // Showing success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                successSnackbar('Box Accepted Succesfully!'),
                              );
                              // Clearing all fields and dropdowns
                              _quantityController.clear();
                              _acceptFormKey.currentState!.reset();
                              _imageProvider.clearImage();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                errorSnackbar('Image Upload Failed'),
                              );
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackbar('Invalid Submission'),
                          );
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
      ),
    );
  }
}
