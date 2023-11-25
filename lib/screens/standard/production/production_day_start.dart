import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/error_display_caption.dart';
import 'package:dth/_common_widgets/image_preview_container.dart';
import 'package:dth/_common_widgets/weight_entry_field.dart';
import 'package:dth/_common_widgets/secondary_elevated_button.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_providers/employee_provider.dart';
import 'package:dth/_providers/image_provider.dart';
import 'package:dth/_providers/production_daystart_provider.dart';
import 'package:dth/_services/image_upload_service.dart';
import 'package:dth/_services/production_day_start_service.dart';
import 'package:dth/_utilites/loading_spinner_modal.dart';
import 'package:dth/_utilites/scaffold_snackbars.dart';
import 'package:dth/_utilites/utility_functions.dart';
import 'package:dth/screens/standard/incoming/widgets/worker_picker_tile.dart';
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
    _productionDayStartProvider.finalWeight = 0.000;
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

  // final TextEditingController _finalWeightController = TextEditingController();
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
                              value: '${provider.finalWeight} kg',
                            ),

                            // Worker data

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
                                Column(
                                  children: provider.addedEmployees
                                      .map(
                                        (worker) => SelectedWorkerTile(
                                          worker: worker,
                                          onDelete: (context) => provider.removeWorker(worker),
                                        ),
                                      )
                                      .toList(),
                                )
                              ],
                            )
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
              hSpace(100),
            ],
          ),
        ),
        bottomNavigationBar: BottomActionsArea(
          children: [
            Expanded(
              child: PrimaryElevatedButton(
                onPressed: () async {
                  final provider = context.read<ProductionDayStartProvider>();
                  if (_formKey.currentState!.validate() && provider.selectedBox != null) {
                    if (_productionDayStartProvider.addedEmployees.isNotEmpty) {
                      if (_imageProvider.image != null) {
                        showLoadingSpinnerModal(context);
                        try {
                          final imageUploadRes =
                              await ImageUploadService().uploadImage(_imageProvider.image!.path);
                          if (imageUploadRes.imagePath != '') {
                            print('image uploaded correctly');

                            if (await ProductionDayStartService().postToProductionDayStart(
                              batchCode: widget.batchCode,
                              boxNum: _productionDayStartProvider.selectedBox!.boxRef,
                              team: hashEmployeeIdsIntoString(
                                  _productionDayStartProvider.addedEmployees),
                              imageURL: imageUploadRes.imagePath,
                              weightShown: provider.weightController.text,
                              calculatedWeight: provider.finalWeight.toString(),
                              process: _productionDayStartProvider.selectedBox!.process,
                            )) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                successSnackbar('Added to daystart'),
                              );
                              provider.clearData();
                              provider.fetchDataAndUpdateState(widget.batchCode);
                            } else {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                errorSnackbar('ERROR: Failed to post to daystart'),
                              );
                            }
                            //print('Form Valid');
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackbar('ERROR: Photo Upload Failed'),
                            );
                          }
                        } catch (e) {
                          Navigator.pop(context);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackbar('ERROR: Photo not taken yet'),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        errorSnackbar('ERROR: Atleast one worker needed!'),
                      );
                    }
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
  required final List<WorkerData> workers,
}) {
  final daystartState = Provider.of<ProductionDayStartProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(globalBorderRadius / 2),
      ),
      child: (workers.isNotEmpty)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(globalBorderRadius / 2),
                      )),
                  width: double.infinity,
                  child: Text(
                    'Select workers for this task',
                    style: TextStyles.mainHeadingStyle.copyWith(
                      color: AppColors.inversePrimaryColor,
                    ),
                  ),
                ),
                appBarUnderline,
                ListView.separated(
                  separatorBuilder: (context, _) => appBarUnderline,
                  shrinkWrap: true,
                  itemCount: workers.length,
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
