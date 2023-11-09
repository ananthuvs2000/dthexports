import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/colordrilldown.dart';
import 'package:dth/screens/standard/widgets/customerdrilldown.dart';
import 'package:dth/screens/standard/widgets/sizedrilldown.dart';
import 'package:dth/screens/standard/widgets/texturedrilldown.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class OutGoingScreen extends StatefulWidget {
  const OutGoingScreen({super.key});

  @override
  State<OutGoingScreen> createState() => _OutGoingScreenState();
}

class _OutGoingScreenState extends State<OutGoingScreen> {
  // final TextEditingController _quantityController = TextEditingController();
  String name = '';

//^ To be handled with state management
  void updateName() {
    setState(() {
      name = '$name 123';
    });
  }

  String selectedOption = 'Yes';
  void _handleRadioValueChange(String value) {
    setState(() {
      selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Outgoing'),
        bottom: appBarUnderline,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: SingleChildScrollView(
            child: Column(
              children: [
                hSpace(10),
                DropdownMenuField(
                  validator: (value) {
                    return '';
                  },
                  fieldLabel: 'Customer Name',
                  dropDownLabel: 'Select Customer',
                  dropdownEntries: const [
                    DropdownMenuItem(value: 'Customer 1', child: Text('Customer 1')),
                    DropdownMenuItem(value: 'Customer 2', child: Text('Customer 2')),
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                DropdownMenuField(
                  validator: (value) {
                    return '';
                  },
                  fieldLabel: 'Size',
                  dropDownLabel: 'Select Size',
                  dropdownEntries: const [],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                DropdownMenuField(
                  validator: (value) {
                    return '';
                  },
                  fieldLabel: 'Colour',
                  dropDownLabel: 'Select Colour',
                  dropdownEntries: const [
                    DropdownMenuItem(value: 'Red', child: Text('Red')),
                    DropdownMenuItem(value: 'Green', child: Text('Green')),
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                DropdownMenuField(
                  validator: (value) {
                    return '';
                  },
                  fieldLabel: 'Box No',
                  dropDownLabel: 'Select Box No',
                  dropdownEntries: const [
                    DropdownMenuItem(value: '15', child: Text('Customer 15')),
                    DropdownMenuItem(value: 'Customer 25', child: Text('Customer 25')),
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                DropdownMenuField(
                  validator: (value) {
                    return '';
                  },
                  fieldLabel: 'Texture',
                  dropDownLabel: 'Select Texture',
                  dropdownEntries: const [],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                const DynamicFieldRow(label: 'Req Qty', value: ''),
                hSpace(20),
                const DynamicFieldRow(label: '2nd Conditioning', value: 'Yes or No'),
                hSpace(20),
                const DynamicFieldRow(label: 'Send For Wefting', value: 'Yes or No'),
                hSpace(30),
                PrimaryElevatedButton(
                  onPressed: () {},
                  label: 'ADD MORE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
