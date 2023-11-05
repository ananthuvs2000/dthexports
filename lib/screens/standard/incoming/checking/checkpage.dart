// import 'package:dth/screens/standard/incoming/checking/datetime_provider.dart';
import 'package:dth/screens/standard/incoming/checking/vendor_provider.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    Provider.of<VendorProvider>(context, listen: false).fetchVendors();
  }

  //
  final _venueController = TextEditingController();
  final _vendorCodeController = TextEditingController();
  final _quantityController = TextEditingController();
  final _teamIdController = TextEditingController();

  ///
  @override
  Widget build(BuildContext context) {
    // Provider
    final vendorProvider = Provider.of<VendorProvider>(context);
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
          child: ListView(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade100),
                child: Center(
                  child: Text(
                    DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    style: labelText(),
                  ),
                ),
              ),
              /////
              // Venue
              hSpace(15),
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

              //! Vendor Code From Consumer
              Consumer<VendorProvider>(builder: (context, vendorData, child) {
                if (vendorProvider.vendors.isNotEmpty) {
                  return DropdownMenuField(
                    controller: _vendorCodeController,
                    fieldLabel: 'Vendor Code',
                    dropDownLabel: 'Select Vendor',
                    // from API
                    dropdownEntries: vendorProvider.vendors
                        .map(
                          (vendor) => DropdownMenuEntry(
                            value: vendor.vendorName,
                            label: vendor.vendorName,
                          ),
                        )
                        .toList(),
                    onSelected: (selectedVal) {},
                  );
                }
                return const Center(
                  child: Text('Failed To Get Vendor Codes'),
                );
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
                        return '';
                      },
                    ),
                  ),
                ],
              ),
              hSpace(15),
              DropdownMenuField(
                controller: _teamIdController,
                fieldLabel: 'Team',
                dropDownLabel: 'Select Team',
                dropdownEntries: const [],
                onSelected: (selectedVal) {},
              ),
              hSpace(25),
              SizedBox(width: 120, child: PrimaryElevatedButton(onPressed: () {}, label: 'POST')),
            ],
          ),
        ),
      ),
    );
  }
}
