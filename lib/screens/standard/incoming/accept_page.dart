import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_providers/dropdown_providers/accept_page_form_provider.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/_providers/item_accept_temp_provider.dart';
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
  late ItemAcceptTempProvider _itemAcceptTemp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageProvider = Provider.of<CameraProvider>(context, listen: false);
    _itemAcceptTemp = Provider.of<ItemAcceptTempProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.delayed(Duration.zero, () {
      _imageProvider.clearImage();
      _dropDownProvider.clearAll();
    });
  }

// Controllers and form key
  final TextEditingController _quantityController = TextEditingController();
  final _acceptFormKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _itemAcceptTemp.getRemainingBoxes(widget.batchCode);
    _dropDownProvider = Provider.of<AcceptPageDropDownProvider>(context, listen: true);

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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSpace(15),
                  DynamicFieldRow(label: 'Batch Code', value: widget.batchCode),
                  hSpace(15),

                  // Consumer to get remaining box nums from temp api
                  Consumer<ItemAcceptTempProvider>(
                    builder: (context, state, _) => DropdownMenuField(
                      key: _dropdownKey,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a value';
                        } else {
                          return null;
                        }
                      },
                      fieldLabel: 'Box No',
                      dropDownLabel: 'Select Box ',
                      dropdownEntries: state.boxesRemaining
                          .map((boxNum) => DropdownMenuItem(
                                value: '$boxNum',
                                child: Text('$boxNum'),
                              ))
                          .toList(),
                      onSelected: (selectedVal) {
                        dropdownState.updateBoxNumber = selectedVal;
                        print(dropdownState.box);
                      },
                    ),
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
                    fieldLabel: 'Size',
                    dropDownLabel: 'Select Size',
                    dropdownEntries: const [
                      DropdownMenuItem(value: '13-15', child: Text('13"-15"')),
                      DropdownMenuItem(value: '16-19', child: Text('16"-19"')),
                      DropdownMenuItem(value: '20-23', child: Text('20"-23"')),
                    ],
                    onSelected: (selectedVal) {
                      dropdownState.updateSize = selectedVal;
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
                    fieldLabel: 'Color',
                    dropDownLabel: 'Select Color',
                    dropdownEntries: const [
                      DropdownMenuItem(value: 'red', child: Text('RED')),
                      DropdownMenuItem(value: 'black', child: Text('BLACK')),
                    ],
                    onSelected: (selectedVal) {
                      dropdownState.updateColor = selectedVal;
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
                    fieldLabel: 'Texture',
                    dropDownLabel: 'Select Texture',
                    dropdownEntries: const [
                      DropdownMenuItem(value: 'wavy', child: Text('WAVY')),
                      DropdownMenuItem(value: 'super_straight', child: Text('SUPER STRAIGHT')),
                    ],
                    onSelected: (selectedVal) {
                      dropdownState.updateTexture = selectedVal;
                      print(selectedVal.toString());
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
                    width: double.infinity,
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
                  Consumer<ItemAcceptTempProvider>(
                    builder: (context, state, _) => ListView.builder(
                      itemCount: state.acceptedBoxes.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(state.acceptedBoxes[index].boxRef);
                      },
                    ),
                  ),
                  hSpace(200),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomActionsArea(
        children: [
          SecondaryElevatedButton(
            icon: Icons.add,
            onPressed: () async {
              if (_acceptFormKey.currentState!.validate()) {
                if (_imageProvider.image != null) {
                  final imageUploadRes =
                      await ImageUploadService().uploadImage(_imageProvider.image!.path);
                  if (imageUploadRes.imagePath != '') {
                    await ItemAcceptTempService().postTempData(
                      batchCode: widget.batchCode,
                      boxRef: _dropDownProvider.box,
                      colorRef: _dropDownProvider.color,
                      textureRef: _dropDownProvider.texture,
                      sizeRef: _dropDownProvider.size,
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
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    errorSnackbar('Error: Did not take a picture'),
                  );
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
          ),
        ],
      ),
    );
  }
}
