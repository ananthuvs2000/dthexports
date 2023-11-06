import 'package:dth/_providers/team_provider.dart';
import 'package:dth/_providers/vendor_provider.dart';
import 'package:dth/_services/checking_service.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/loading_display_caption.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
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
  final _venueController = TextEditingController();
  final _vendorCodeController = TextEditingController();
  final _quantityController = TextEditingController();
  final _teamIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Provider
    final vendorProvider = Provider.of<VendorProvider>(context);
    final teamProvider = Provider.of<TeamProvider>(context);
    // final dateTimeProvider = Provider.of<DateTimeProvider>(context);
    // UI
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const Text('CHECKING'),
          bottom: appBarUnderline,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //! DateTime from API Consumer
                hSpace(15),

                // Venue
                hSpace(20),
                DropdownMenuField(
                  controller: _venueController,
                  fieldLabel: 'Venue',
                  dropDownLabel: 'SELECT VENUE',
                  defaultValue: 'IN_HOUSE',
                  dropdownEntries: const [
                    DropdownMenuEntry(value: 'IN_HOUSE', label: 'In House'),
                    DropdownMenuEntry(value: 'OUT_STATION', label: 'Out Station'),
                  ],
                  onSelected: (selectedValue) {},
                ),
                hSpace(15),

                //! Team List From Team API Consumer
                Consumer<VendorProvider>(builder: (context, vendorData, child) {
                  if (vendorProvider.vendors.isNotEmpty) {
                    return DropdownMenuField(
                      controller: _vendorCodeController,
                      fieldLabel: 'Vendor',
                      dropDownLabel: 'Select Vendor',
                      // from API
                      dropdownEntries: vendorProvider.vendors
                          .map(
                            (vendor) => DropdownMenuEntry(
                              value: vendor.id.toString(),
                              label: vendor.vendorName,
                            ),
                          )
                          .toList(),
                      onSelected: (selectedVal) {
                        print(selectedVal);
                      },
                    );
                  }
                  return const Center(child: LoadingDisplayCaption(message: 'Loading Vendor Info'));
                }),
                hSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total QTY Checked',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    wSpace(60),
                    Expanded(
                      child: DthTextField(
                        hintText: 'XX.XX KG',
                        controller: _quantityController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid Quantity';
                          }
                          return '';
                        },
                      ),
                    ),
                  ],
                ),
                hSpace(15),

                //! Team List From Team API Consumer
                Consumer(builder: (context, state, child) {
                  if (teamProvider.teams.isNotEmpty) {
                    return DropdownMenuField(
                      controller: _teamIdController,
                      fieldLabel: 'Team',
                      dropDownLabel: 'Select Team',
                      dropdownEntries: teamProvider.teams
                          .map(
                            (team) => DropdownMenuEntry(
                              value: team.id.toString(),
                              label: team.teamName,
                            ),
                          )
                          .toList(),
                      onSelected: (selectedVal) {
                        print('Team Selected: $selectedVal');
                      },
                    );
                  } else {
                    return const Center(child: LoadingDisplayCaption(message: 'Loading Team Info'));
                  }
                }),
                hSpace(25),

                // Submit Button
                SizedBox(
                  width: 120,
                  child: PrimaryElevatedButton(
                    onPressed: () {
                      print({
                        _venueController.text,
                        _vendorCodeController.text,
                        _quantityController.text,
                        _teamIdController.text,
                      });
                      //
                      // if (_formKey.currentState!.validate()) {
                      //   print('Submitted succesfully');
                      // } else {
                      //   print('Form Error');
                      // }
                    },
                    label: 'POST',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
