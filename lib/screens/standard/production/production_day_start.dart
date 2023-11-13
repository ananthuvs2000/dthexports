import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_providers/dropdown_providers/accept_page_form_provider.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/bottom_actions_area.dart';
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
import 'package:provider/provider.dart';

class DayStart extends StatefulWidget {
  const DayStart({super.key});

  @override
  State<DayStart> createState() => _DayStartState();
}

class _DayStartState extends State<DayStart> {
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
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Production Day Start'),
        bottom: appBarUnderline,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            children: [
              hSpace(20),
              const DynamicFieldRow(label: 'Batch No:', value: 'Display Batch No'),
              hSpace(15),
              DropdownMenuField(
                validator: (value) {
                  return '';
                },
                fieldLabel: 'Box No:',
                dropDownLabel: 'Select Box',
                dropdownEntries: const [
                  DropdownMenuItem(value: '1', child: Text('1')),
                  DropdownMenuItem(value: '2', child: Text('2')),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('3'),
                  )
                ],
                onSelected: (selectedVal) {
                  print(selectedVal.toString());
                },
              ),
              hSpace(15),
              const BoxInfoDisplay(
                  boxNumber: 'No.', boxType: 'Type', boxSize: 'Size', boxWeight: 'Weight'),
              const SizedBox(height: 20),
              const DynamicFieldRow(label: 'Process', value: 'Display Process'),
              hSpace(15),
              DropdownMenuField(
                validator: (value) {
                  return '';
                },
                fieldLabel: 'Team',
                dropDownLabel: 'Select Team',
                dropdownEntries: const [
                  DropdownMenuItem(value: 'Team 1', child: Text('Team 1')),
                  DropdownMenuItem(value: 'Team 2', child: Text('Team 2')),
                  DropdownMenuItem(value: 'Team 3', child: Text('Team 3')),
                ],
                onSelected: (selectedVal) {
                  print(selectedVal.toString());
                },
              ),
                
              hSpace(15),
              const DynamicFieldRow(
                  label: 'Material Weight', value: 'Calculate Weight&Display'),
              hSpace(15),
              TeamManagerWidget(
                editable: true,
                teamList: [
                  WorkerData(id: 10, name: 'Athul'),
                  WorkerData(id: 15, name: 'Amal'),
                ],
              ),
                
              hSpace(15),
              // Consumer<CameraProvider>(
              //   builder: (context, state, child) {
              //     if (_imageProvider.image == null) {
              //       return const SizedBox();
              //     } else {
              //       return ImagePreviewBox(image: _imageProvider.image);
              //     }
              //   },
              // ),
              //! ^ IMAGE PREVIEW AREA
              // OpenImageButton(
              //   icon: Icons.camera,
              //   label: 'Take Photo',
              //   onTap: () async {
              //     await _imageProvider.getImage();
              //   },
              // ),
              // hSpace(15),
              // // Field to Enter Value
              // NumberEntryField(
              //   label: 'Enter value shown',
              //   controller: TextEditingController(),
              //   validator: (value) {
              //     return null;
              //   },
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
             
              // End of listview
          
            ],
          ),
        ),
      ),
      bottomNavigationBar:     BottomActionsArea(
                  children: [
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
