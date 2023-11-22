import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/error_display_caption.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_common_widgets/number_entry_field.dart';
import 'package:dth/_common_widgets/secondary_elevated_button.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_providers/employee_provider.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/_providers/production_daystart_provider.dart';
import 'package:dth/_services/image_upload_service.dart';
import 'package:dth/_services/production_day_start_service.dart';
import 'package:dth/_utilites/scaffold_snackbars.dart';
import 'package:dth/_utilites/utility_functions.dart';
import 'package:dth/screens/standard/incoming/widgets/employee_picker_tile.dart';
import 'package:dth/screens/standard/incoming/widgets/selected_employee_tile.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/box_info_display.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/dynamic_field_row.dart';
import 'package:dth/_common_widgets/open_camera_button.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DayStart extends StatefulWidget {
  const DayStart({super.key, required this.batchCode});

  final String batchCode;

  @override
  State<DayStart> createState() => _DayStartState();
}

class _DayStartState extends State<DayStart> {
  late CameraProvider _imageProvider;
  late ProductionDayStartProvider _productionDayStartProvider;
  late WorkerProvider _workerDataProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageProvider = Provider.of<CameraProvider>(context, listen: false);
    _productionDayStartProvider = Provider.of<ProductionDayStartProvider>(context, listen: false);
    _workerDataProvider = Provider.of<WorkerProvider>(context, listen: false);
    _finalWeightController.text = '0';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.delayed(Duration.zero, () {
      _imageProvider.clearImage();
      _productionDayStartProvider.removeListener(() {});
    });
  }

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _finalWeightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _productionDayStartProvider.fetchDataAndUpdateState(widget.batchCode);
    _workerDataProvider.fetchWorkers();

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.inversePrimaryColor,
          title: const Text('Production Day Start'),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hSpace(20),
              DynamicFieldRow(label: 'Batch No:', value: widget.batchCode),
              hSpace(15),
              Consumer<ProductionDayStartProvider>(
                builder: (context, provider, _) {
                  return Column(
                    children: [
                      DropdownMenuField(
                        validator: (value) {
                          if (value == '' || value == null) {
                            return 'Select A Box';
                          }
                          return null;
                        },
                        fieldLabel: 'Box No:',
                        dropDownLabel: 'Select Box',
                        dropdownEntries: provider.boxDataList
                            .map(
                              (box) => DropdownMenuItem(
                                value: box.boxRef,
                                child: Text(box.boxRef),
                              ),
                            )
                            .toList(),
                        onSelected: (selectedVal) {
                          // Fetch box data based on selected boxRef
                          provider.findBoxByBoxRef(selectedVal);
                        },
                      ),
                      // Update BoxInfoDisplay parameters
                      if (provider.selectedBox != null)
                        Column(
                          children: [
                            hSpace(20),
                            BoxInfoDisplay(
                              box: provider.selectedBox!,
                            ),
                            hSpace(5),

                            //^ Have cleaning form based on process value
                            DynamicFieldRow(label: 'Process', value: provider.selectedBox!.process),
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
                              inputFormatter: [
                                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,5}$')),
                              ],
                              label: 'Enter weight as shown',
                              controller: provider.weightController,
                              validator: (value) {
                                if (value == '') return 'Please enter a weight';
                                return null;
                              },
                              onChanged: (value) {
                                provider.calculateMaterialWeight(value);
                              },
                            ),
                            hSpace(15),
                            DynamicFieldRow(
                              label: 'Material Weight',
                              value: '${provider.finalWeightController.text} kg',
                            ),

                            // Worker data
                            if (provider.workerDataList.isNotEmpty)
                              Column(
                                children: [
                                  hSpace(10),
                                  Consumer<WorkerProvider>(
                                    builder: (context, state, _) => SecondaryElevatedButton(
                                      onPressed: () => showEmployeePicker(
                                        context: context,
                                        workers: state.workersList,
                                      ),
                                      label: 'Add More Workers',
                                      icon: Icons.add,
                                    ),
                                  ),
                                  hSpace(10),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: provider.workerAddedList.toList().length,
                                    itemBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return SelectedWorkerTile(
                                        worker: provider.workerAddedList.toList()[index],
                                        onDelete: (context) => provider
                                            .removeWorker(provider.workerAddedList.toList()[index]),
                                      );
                                    },
                                  ),
                                ],
                              )
                            else
                              const ErrorDisplayCaption(message: 'Could not fetch worker data'),
                          ],
                        )
                      else
                        const ErrorDisplayCaption(
                          message: 'Please select a box',
                        ),
                    ],
                  );
                },
              ),
              const Divider(),

              hSpace(50),
              // End of listview
            ],
          ),
        ),
        bottomNavigationBar: BottomActionsArea(
          children: [
            Expanded(
              child: PrimaryElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final provider = Provider.of<ProductionDayStartProvider>(context);
                    if (_imageProvider.image != null) {
                      final imageUploadRes =
                          await ImageUploadService().uploadImage(_imageProvider.image!.path);
                      if (imageUploadRes.imagePath != '') {
                        print('image uploaded correctly');

                        if (await ProductionDayStartService().postToProductionDayStart(
                          batchCode: widget.batchCode,
                          boxNum: _productionDayStartProvider.selectedBox!.boxRef,
                          team: hashEmployeeIdsIntoString(
                              _productionDayStartProvider.workerDataList.toSet()),
                          imageURL: imageUploadRes.imagePath,
                          weightShown: provider.weightController.text,
                          calculatedWeight: provider.finalWeightController.text,
                          process: _productionDayStartProvider.selectedBox!.process,
                        )) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            successSnackbar('Added to daystart'),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackbar('ERROR: Failed to post to daystart'),
                          );
                        }
                        //print('Form Valid');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackbar('ERROR: Image Upload Failed'),
                        );
                      }
                    } else {}
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      errorSnackbar('ERROR: Invalid form submission'),
                    );
                  }
                },
                label: 'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showEmployeePicker({
  required BuildContext context,
  required final List<Workerdatum> workers,
}) {
  final daystartState = Provider.of<ProductionDayStartProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(globalBorderRadius),
      ),
      child: (workers.isNotEmpty)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                hSpace(10),
                Text(
                  'Select Workers in the team',
                  style: TextStyles.mainHeadingStyle,
                ),
                hSpace(4),
                appBarUnderline,
                hSpace(3),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  itemCount: workers.length,
                  itemExtent: 55,
                  itemBuilder: (context, index) {
                    return WorkerPickerTile(
                      worker: workers[index],
                      onAdd: () async {
                        print(workers[index]);
                        if (!daystartState.workerExists(workers[index])) {
                          daystartState.addWorker(workers[index]);
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackbar('ERROR: Employee Already Added'),
                          );
                          Navigator.pop(context);
                        }
                      },
                    );
                  },
                ),
              ],
            )
          : const SizedBox(),
    ),
  );
}
