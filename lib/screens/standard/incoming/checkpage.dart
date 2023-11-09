import 'package:dth/_providers/checking_provider.dart';
// import 'package:dth/_providers/datetime_provider.dart';
import 'package:dth/_providers/team_provider.dart';
import 'package:dth/_providers/vendor_provider.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/loading_display_caption.dart';
import 'package:dth/widgets/number_entry_field.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
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
    // Provider.of<DateTimeProvider>(context, listen: false).fetchDateTime();
  }

  //^ Form Key
  final _formKey = GlobalKey<FormState>();
  //^ Setting all form field controllers
  final _quantityController = TextEditingController();
  String _selectedVenue = '';
  String _selectedVendor = '';
  String _selectedTeam = '';

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
          child: ListView(
            shrinkWrap: true,
            children: [
              //! DateTime from API Consumer
              hSpace(15),

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
              hSpace(15),

              //! Team List From Team API Consumer
              Consumer(builder: (context, state, child) {
                if (teamProvider.teams.isNotEmpty) {
                  return DropdownMenuField(
                    validator: (value) {
                      if (value == null) {
                        return 'Select a team';
                      } else {
                        return null;
                      }
                    },
                    fieldLabel: 'Team',
                    dropDownLabel: 'Select Team',
                    dropdownEntries: teamProvider.teams
                        .map(
                          (team) => DropdownMenuItem(
                            value: team.id.toString(),
                            child: Text(team.teamName),
                          ),
                        )
                        .toList(),
                    onSelected: (selectedVal) {
                      setState(() {
                        _selectedTeam = selectedVal;
                      });
                    },
                  );
                } else {
                  return const Center(
                    child: LoadingDisplayCaption(
                      message: 'Loading Team Info',
                    ),
                  );
                }
              }),
              hSpace(25),

              // Submit Button
              PrimaryElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('Form Valid');
                    final res = CheckingProvider().postToCheck(
                      _selectedVenue,
                      _selectedVendor,
                      _quantityController.text,
                      _selectedTeam,
                    );
                    if (await res) {
                      print('Succesfully posted');
                      Get.snackbar(
                        'Success',
                        'Succesfully Posted To Checking!',
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 1),
                      );
                    } else {
                      print('Post failed');
                    }
                  } else {
                    print('Form Invalid');
                  }
                },
                label: 'Post',
              ),
              hSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
