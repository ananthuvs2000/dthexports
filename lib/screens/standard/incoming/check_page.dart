import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/_providers/checking_provider.dart';
import 'package:dth/_providers/employee_provider.dart';
import 'package:dth/_utilites/loading_spinner_modal.dart';
import 'package:dth/_utilites/utility_functions.dart';
// import 'package:dth/_providers/datetime_provider.dart';
import 'package:dth/_providers/team_provider.dart';
import 'package:dth/_providers/vendor_provider.dart';
import 'package:dth/_utilites/scaffold_snackbars.dart';
import 'package:dth/screens/standard/incoming/widgets/worker_picker_tile.dart';
import 'package:dth/screens/standard/incoming/widgets/selected_employee_tile.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/error_display_caption.dart';
import 'package:dth/_common_widgets/loading_display_caption.dart';
import 'package:dth/_common_widgets/weight_entry_field.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/secondary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  late CheckingProvider checkingProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //! ONE TIME FETCHING OF ALL API INFO FROM PROVIDER DURING PAGE INITIALIZATION
    Provider.of<VendorProvider>(context, listen: false).fetchVendors();
    Provider.of<TeamProvider>(context, listen: false).fetchTeams();
    Provider.of<WorkerProvider>(context, listen: false).fetchWorkers();
    // Provider.of<DateTimeProvider>(context, listen: false).fetchDateTime();
    checkingProvider = Provider.of<CheckingProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    Future.delayed(Duration.zero, () {
      checkingProvider.clearEmployees();
    });
  }

  //^ Form Key
  final _formKey = GlobalKey<FormState>();
  //^ Setting all form field controllers
  final _quantityController = TextEditingController();
  String _selectedVenue = '';
  String _selectedVendor = '';

  @override
  Widget build(BuildContext context) {
    // Provider init
    final vendorProvider = Provider.of<VendorProvider>(context);
    // final checkingProvider = Provider.of<CheckingProvider>(context);
    // final dateTimeProvider = Provider.of<DateTimeProvider>(context);
    // UI
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Checking'),
        bottom: appBarUnderline,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //! DateTime from API Consumer

                // Venue
                hSpace(20),
                DropdownMenuField(
                  validator: (value) {
                    if (value == null) {
                      return 'Select a venue';
                    } else {
                      return null;
                    }
                  },
                  fieldLabel: 'Venue',
                  dropDownLabel: 'Select the venue',
                  dropdownEntries: const [
                    DropdownMenuItem(value: 'In-House', child: Text('In House')),
                    DropdownMenuItem(value: 'Out-Station', child: Text('Out Station')),
                  ],
                  onSelected: (value) {
                    setState(() {
                      _selectedVenue = value;
                    });
                    print(_selectedVenue);
                  },
                ),
                hSpace(15),

                //! Team List From Team API Consumer
                Consumer<VendorProvider>(builder: (context, vendorData, child) {
                  if (vendorProvider.vendors.isNotEmpty) {
                    return DropdownMenuField(
                      validator: (value) {
                        if (value == null) {
                          return 'Select a vendor';
                        } else {
                          return null;
                        }
                      },
                      fieldLabel: 'Vendor',
                      dropDownLabel: 'Select Vendor',
                      // from API
                      dropdownEntries: vendorProvider.vendors
                          .map(
                            (vendor) => DropdownMenuItem(
                              value: vendor.id.toString(),
                              child: Text(vendor.vendorCode),
                            ),
                          )
                          .toList(),
                      onSelected: (value) {
                        setState(() {
                          _selectedVendor = value;
                        });
                      },
                    );
                  }
                  return const Center(child: LoadingDisplayCaption(message: 'Loading Vendor Info'));
                }),
                hSpace(15),
                NumberEntryField(
                  label: 'Total Qty Checked',
                  controller: _quantityController,
                  validator: (value) {
                    if (value == '') {
                      return 'Invalid Number';
                    } else {
                      return null;
                    }
                  },
                ),

                // Add employees button
                hSpace(15),
                //! 1. Fetching all employees from employees provider
                //! 2 Creating a team from the given employees (duplicate checking done with Set)
                Consumer<WorkerProvider>(
                  builder: (context, employeeData, child) {
                    if (employeeData.workersList.isEmpty) {
                      return const Center(
                          child: ErrorDisplayCaption(message: 'No Employees Available'));
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: SecondaryElevatedButton(
                              onPressed: () => showEmployeePicker(
                                context: context,
                                employees: employeeData.workersList,
                                addedEmployees: checkingProvider.addedEmpoyees,
                              ),
                              label: 'Select Employees',
                              icon: Icons.add,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                hSpace(15),
                // Future for fetching picked employees
                Consumer<CheckingProvider>(
                  builder: (context, selectedEmployeeState, _) {
                    if (selectedEmployeeState.addedEmpoyees.isEmpty) {
                      return const Center(
                        child: ErrorDisplayCaption(
                          message: 'Please select Employees',
                        ),
                      );
                    } else {
                      return GridView.count(
                        shrinkWrap: true,
                        childAspectRatio: 2,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: (selectedEmployeeState.addedEmpoyees.isNotEmpty)
                            ? selectedEmployeeState.addedEmpoyees
                                .map(
                                  (e) => SelectedWorkerTile(
                                    worker: e,
                                    onDelete: (context) =>
                                        selectedEmployeeState.removeSelectedEmployee(e),
                                  ),
                                )
                                .toList()
                            : [],
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomActionsArea(children: [
        Expanded(
          child: PrimaryElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                showLoadingSpinnerModal(context);
                final String hash = hashEmployeeIdsIntoString(checkingProvider.addedEmpoyees);
                if (hash == '') {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(errorSnackbar('Failed to assign employees'));
                }
                final resOfTeamCreation = TeamProvider().postToTeam(hash);
                final res = CheckingProvider().postToCheck(
                  _selectedVenue,
                  _selectedVendor,
                  _quantityController.text,
                  hash,
                );
                if (await resOfTeamCreation && await res) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(successSnackbar('Succesfully Posted!'));

                  // Clearing all fields and dropdowns
                  checkingProvider.addedEmpoyees.clear();
                  _formKey.currentState!.reset();
                  _quantityController.clear();
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(errorSnackbar('Failed to post material check!'));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(errorSnackbar('Invalid Submission!'));
              }
            },
            label: 'Post',
          ),
        ),
      ]),
    );
  }

  showEmployeePicker({
    required BuildContext context,
    required final List<WorkerData> employees,
    required final Set<WorkerData> addedEmployees,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(globalBorderRadius / 2),
        ),
        child: (employees.isNotEmpty)
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
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final checkProv = Provider.of<CheckingProvider>(context, listen: true);
                      return WorkerPickerTile(
                        worker: employees[index],
                        onAdd: () {
                          if (!checkProv.addedEmpoyees.contains(employees[index])) {
                            checkProv.addEmployee(employees[index]);
                            print(employees[index]);
                            print(checkProv.addedEmpoyees);
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
}

//   showEmployeePicker({
//     required BuildContext context,
//     required final List<WorkerData> employees,
//     required final Set<WorkerData> addedEmployees,
//   }) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         backgroundColor: Colors.white,
//         alignment: Alignment.center,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(globalBorderRadius),
//         ),
//         child: (employees.isNotEmpty)
//             ? Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   hSpace(10),
//                   Text(
//                     'Select Employees in the team',
//                     style: TextStyles.mainHeadingStyle,
//                   ),
//                   hSpace(4),
//                   appBarUnderline,
//                   hSpace(3),
//                   ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     shrinkWrap: true,
//                     itemCount: employees.length,
//                     itemExtent: 55,
//                     itemBuilder: (context, index) {
//                       final checkProv = Provider.of<CheckingProvider>(context, listen: true);
//                       return WorkerPickerTile(
//                         worker: employees[index],
//                         onAdd: () {
//                           if (!checkProv.addedEmpoyees.contains(employees[index])) {
//                             checkProv.addEmployee(employees[index]);
//                             print(employees[index]);
//                             print(checkProv.addedEmpoyees);
//                             Navigator.pop(context);
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               errorSnackbar('ERROR: Employee Already Added'),
//                             );
//                             Navigator.pop(context);
//                           }
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               )
//             : const SizedBox(),
//       ),
//     );
//   }
// }
