import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_models/employee_model.dart';
import 'package:dth/_providers/checking_provider.dart';
import 'package:dth/_providers/employee_provider.dart';
import 'package:dth/_utilites/utility_functions.dart';
// import 'package:dth/_providers/datetime_provider.dart';
import 'package:dth/_providers/team_provider.dart';
import 'package:dth/_providers/vendor_provider.dart';
import 'package:dth/_utilites/scaffold_snackbars.dart';
import 'package:dth/screens/standard/incoming/widgets/employee_picker_tile.dart';
import 'package:dth/screens/standard/incoming/widgets/selected_employee_tile.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/error_display_caption.dart';
import 'package:dth/_common_widgets/loading_display_caption.dart';
import 'package:dth/_common_widgets/number_entry_field.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/secondary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  late CheckingProvider _checkingProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //! ONE TIME FETCHING OF ALL API INFO FROM PROVIDER DURING PAGE INITIALIZATION
    Provider.of<VendorProvider>(context, listen: false).fetchVendors();
    Provider.of<TeamProvider>(context, listen: false).fetchTeams();
    Provider.of<EmployeeProvider>(context, listen: false).fetchEmployees();
    // final _checkProvider = Provider.of<CheckingProvider>(context, listen: false);
    // Provider.of<DateTimeProvider>(context, listen: false).fetchDateTime();
  }

  @override
  void dispose() {
    super.dispose();
    Future.delayed(Duration.zero, () {
      _checkingProvider.clearEmployees();
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
    final checkProvider = Provider.of<CheckingProvider>(context);
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
                Consumer<EmployeeProvider>(
                  builder: (context, employeeData, child) {
                    if (employeeData.employees.isEmpty) {
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
                                employees: employeeData.employees,
                                addedEmployees: checkProvider.addedEmpoyees,
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
                      return Column(
                        children: selectedEmployeeState.addedEmpoyees
                            .map((e) => SelecteEmployeeTile(employee: e))
                            .toList(),
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
                final String hash = hashEmployeeIdsIntoString(checkProvider.addedEmpoyees);
                if (hash == '') {
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
                  ScaffoldMessenger.of(context)
                      .showSnackBar(successSnackbar('Succesfully Posted!'));

                  // Clearing all fields and dropdowns
                  checkProvider.addedEmpoyees.clear();
                  _formKey.currentState!.reset();
                  _quantityController.clear();
                } else {
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
    required final List<Employee> employees,
    required final Set<Employee> addedEmployees,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(globalBorderRadius),
        ),
        child: (employees.isNotEmpty)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  hSpace(10),
                  const Text('Select Employees in the team'),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    itemCount: employees.length,
                    itemExtent: 55,
                    itemBuilder: (context, index) {
                      final checkProv = Provider.of<CheckingProvider>(context, listen: true);
                      return AddEmployeeTile(
                        emp: employees[index],
                        onAdd: () {
                          if (!checkProv.addedEmpoyees.contains(employees[index])) {
                            checkProv.addEmployee(employees[index]);
                            print(checkProv.addedEmpoyees);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackbar('ERROR: Employee Already Added'),
                            );
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
