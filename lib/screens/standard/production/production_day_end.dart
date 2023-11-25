import 'package:dth/_common_widgets/error_display_caption.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/_providers/production_dayend_provider.dart';
import 'package:dth/_providers/production_daystart_provider.dart';
import 'package:dth/screens/standard/production/widgets/work_entry_table.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/box_info_display.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/dynamic_field_row.dart';
import 'package:dth/_common_widgets/weight_entry_field.dart';
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
  late ProductionDayStartProvider _productionDayStartProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageProvider = Provider.of<CameraProvider>(context, listen: false);
    _productionDayStartProvider = Provider.of<ProductionDayStartProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.delayed(Duration.zero, () {
      _imageProvider.clearImage();
      _productionDayStartProvider.clearData();
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _productionDayStartProvider.fetchDataAndUpdateState(widget.batchCode);
    return Form(
      key: _formKey,
      child: Consumer<ProductionDayEndProvider>(
        builder: (context, dayEndProvider, _) => Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.inversePrimaryColor,
            title: const Text('Production Day End'),
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
              child: Column(
                children: [
                  hSpace(15),
                  DynamicFieldRow(label: 'Batch No', value: widget.batchCode),
                  hSpace(15),
                  Consumer<ProductionDayStartProvider>(
                    builder: (context, dayStartProvider, child) => Column(
                      children: [
                        DropdownMenuField(
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Please select a box';
                            }
                            return null;
                          },
                          fieldLabel: 'Box No:',
                          dropDownLabel: 'Select Box',
                          dropdownEntries: dayStartProvider.boxDataList
                              .map(
                                (box) => DropdownMenuItem(
                                  value: box.boxRef,
                                  child: Text(box.boxRef),
                                ),
                              )
                              .toList(),
                          onSelected: (selected) {
                            print(selected.toString());
                            dayStartProvider.findBoxByBoxRef(selected);
                          },
                        ),
                        hSpace(15),
                        if (dayStartProvider.selectedBox != null)
                          Column(
                            children: [
                              BoxInfoDisplay(
                                box: dayStartProvider.selectedBox!,
                              ),

                              Consumer<CameraProvider>(
                                builder: (context, state, _) {
                                  if (_imageProvider.image == null) {
                                    return const SizedBox();
                                  } else {
                                    return ImagePreviewBox(image: _imageProvider.image);
                                  }
                                },
                              ),
                              hSpace(10),
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
                              hSpace(15),

                              // Field to Enter Value
                              NumberEntryField(
                                label: 'Enter weight as shown',
                                controller: dayEndProvider.weightController,
                                validator: (value) {
                                  return null;
                                },
                              ),

                              hSpace(15),
                              DynamicFieldRow(
                                label: 'Balance',
                                value: dayEndProvider.enteredWeight.toString(),
                              ),
                              hSpace(15),
                              DynamicFieldRow(
                                  label: 'Total Process Wastage',
                                  value: dayEndProvider.totalWastage.toString()),
                              hSpace(15),
                              // const TableWidget(),
                              // ! Table widget for showing each workers contribution
                              // !For every X weight taken from the box
                              (6 > 5)
                                  ? WorkEntryTableDayEnd(
                                      totalWastage: 75,
                                      individualWastages: [],
                                      workersList: [
                                        WorkerData(
                                          name: 'Arun',
                                          empCode: '001',
                                          createdAt: DateTime.now(),
                                        ),
                                        WorkerData(
                                          name: 'Jason',
                                          empCode: '002',
                                          createdAt: DateTime.now(),
                                        ),
                                      ],
                                      quantityControllers: [],
                                      outputControllers: [],
                                    )
                                  : const ErrorDisplayCaption(message: 'Failed to get worker data'),

                              hSpace(15), //^ end of listview
                            ],
                          ),
                      ],
                    ),
                  ), // Daystart consumer
                  hSpace(15),
                ],
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_imageProvider.image != null) {
                        print('Form valid');
                      }
                    }
                  },
                  label: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ), // dayend consumer
    );
  }
}
