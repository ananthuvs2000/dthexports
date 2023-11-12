import 'package:dth/_common_widgets/bottom_actions_area.dart';
import 'package:dth/_common_widgets/switch_tile.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/dynamic_field_row.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';

class OutGoingScreen extends StatefulWidget {
  const OutGoingScreen({super.key});

  @override
  State<OutGoingScreen> createState() => _OutGoingScreenState();
}

class _OutGoingScreenState extends State<OutGoingScreen> {
  // final TextEditingController _quantityController = TextEditingController();
  String name = '';

  final _formKey = GlobalKey<FormState>();

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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                hSpace(15),
                DropdownMenuField(
                  validator: (value) {
                    return null;
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
                hSpace(15),
                DropdownMenuField(
                  validator: (value) {
                    return null;
                  },
                  fieldLabel: 'Size',
                  dropDownLabel: 'Select Size',
                  dropdownEntries: const [],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(15),
                DropdownMenuField(
                  validator: (value) {
                    return null;
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
                hSpace(15),
                DropdownMenuField(
                  validator: (value) {
                    return null;
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
                hSpace(15),
                DropdownMenuField(
                  validator: (value) {
                    return null;
                  },
                  fieldLabel: 'Texture',
                  dropDownLabel: 'Select Texture',
                  dropdownEntries: const [],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                const DynamicFieldRow(label: 'Req Qty', value: 'CALCULATED'),
                hSpace(20),
                CustomSwitchTile(title: '2nd Contitioning'),
                // const DynamicFieldRow(label: '2nd Conditioning', value: 'Yes or No'),
                hSpace(20),
                // const DynamicFieldRow(label: 'Send For Wefting', value: 'Yes or No'),
                
                CustomSwitchTile(title: 'Send for Wefting'),
                hSpace(30),
               
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  BottomActionsArea(
                children: [
                  Expanded(
                    child: PrimaryElevatedButton(
                    onPressed: () {},
                    label: 'ADD MORE',
                  ),
                  ),
                ],
              ),
    );
    
  }
}
