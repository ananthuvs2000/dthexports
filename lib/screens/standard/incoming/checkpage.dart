import 'package:dth/_models/employee_model.dart';
import 'package:dth/_providers/checking_provider.dart';
import 'package:dth/_providers/employee_provider.dart';
import 'package:dth/_providers/team_creation_provider.dart';
// import 'package:dth/_providers/datetime_provider.dart';
import 'package:dth/_providers/team_provider.dart';
import 'package:dth/_providers/vendor_provider.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/loading_display_caption.dart';
import 'package:dth/widgets/number_entry_field.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/secondary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //! ONE TIME FETCHING OF ALL API INFO FROM PROVIDER DURING PAGE INITIALIZATION
    Provider.of<VendorProvider>(context, listen: false).fetchVendors();
    Provider.of<TeamProvider>(context, listen: false).fetchTeams();
    Provider.of<EmployeeProvider>(context, listen: false).fetchEmployees();
    // Provider.of<DateTimeProvider>(context, listen: false).fetchDateTime();
  }

  //^ Form Key
  final _formKey = GlobalKey<FormState>();
  //^ Setting all form field controllers
  final _quantityController = TextEditingController();
  String _selectedVenue = '';
  String _selectedVendor = '';

  @override
  Widget build(BuildContext context) {
    // Provider
    final vendorProvider = Provider.of<VendorProvider>(context);
    final teamProvider = Provider.of<TeamProvider>(context);
    // final dateTimeProvider = Provider.of<DateTimeProvider>(context);
    // UI
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Checking'),
        bottom: appBarUnderline,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
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
                    return const Center(
                        child: LoadingDisplayCaption(message: 'Loading Vendor Info'));
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
                  //! 2 Creating a team from the given employees (duplicate checking needed)
                  Consumer<EmployeeProvider>(
                    builder: (context, employeeData, child) {
                      if (employeeData.employees.isEmpty) {
                        return const Center(child: Text('No employees'));
                      } else if (teamProvider.teams.isNotEmpty) {
                        return Column(
                          children: [
                            SecondaryElevatedButton(
                              onPressed: () => showEmployeePicker(
                                context: context,
                                employees: employeeData.employees,
                                addedEmployees: teamProvider.addedEmps,
                              ),
                              label: 'Select Employees',
                              icon: Icons.add,
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),

                  //
                  // Submit Button
                  hSpace(10),
                  PrimaryElevatedButton(
                    onPressed: () async {
                      print(teamProvider.addedEmps);
                      print('Form Valid');
                      // teamProvider.addedEmps.clear();
                      teamProvider.addedEmps.map((e) => e.id);
                      if (_formKey.currentState!.validate()) {
                        final String hash = TeamCreationProvider()
                            .hashEmployeeIdsIntoString(teamProvider.addedEmps);
                        final resOfTeamCreation = TeamProvider().postToTeam(hash);
                        final res = CheckingProvider().postToCheck(
                          _selectedVenue,
                          _selectedVendor,
                          _quantityController.text,
                          hash,
                        );
                        if (await resOfTeamCreation && await res) {
                          print('Succesfully posted');
                          Get.snackbar(
                            'Success',
                            'Succesfully Posted To Checking and Created a Team with the selected employees',
                            snackPosition: SnackPosition.TOP,
                            duration: const Duration(seconds: 1),
                          );
                          // Clearing all fields and dropdowns
                          _formKey.currentState!.reset();
                          _quantityController.clear();
                        } else {
                          print('Post failed');
                        }
                      } else {
                        print('Form Invalid');
                      }
                    },
                    label: 'Post',
                  ),
                ],
              ), //
            ],
          ),
        ),
      ),
    );
  }

  showEmployeePicker({
    required BuildContext context,
    required final List<Employee> employees,
    required final List<Employee> addedEmployees,
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
                      return addEmployeeTile(
                        employees[index],
                        () {
                          if (!TeamProvider().addedEmps.contains(employees[index])) {
                            setState(() {
                              TeamProvider().addedEmps.add(employees[index]);
                              EmployeeProvider().employees.remove(employees[index]);
                            });
                          } else {
                            print('Already added');
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

Widget addEmployeeTile(
  Employee emp,
  void Function()? onAdd,
) {
  return ListTile(
    leading: Text(emp.employeeCode),
    title: Text(emp.employeeName),
    trailing: IconButton(
      splashRadius: 20,
      onPressed: onAdd,
      icon: Icon(
        Icons.add,
        size: 20,
        color: primaryColor,
      ),
    ),
  );
}
