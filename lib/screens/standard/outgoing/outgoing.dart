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
  final TextEditingController _quantityController = TextEditingController();
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
                  controller: TextEditingController(),
                  fieldLabel: 'Customer Name',
                  dropDownLabel: 'Select Customer',
                  dropdownEntries: const [
                    DropdownMenuEntry(value: 'Customer 1', label: 'Customer 1'),
                    DropdownMenuEntry(value: 'Customer 2', label: 'Customer 2'),
                    
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     TextButton(
                //         onPressed: () {
                //           updateName();
                //         },
                //         child: Text(
                //           'Generate order No:',
                //           style: labelText(),
                //         )),
                //     Container(
                //       margin: const EdgeInsets.only(right: 8),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           border: Border.all(color: Colors.black54)),
                //       padding: const EdgeInsets.all(5.0),
                //       child: Text(
                //         'ORDER NO: $name',
                //         style: labelText(),
                //       ),
                //     ),
                //   ],
                // ),
                hSpace(10),
               DropdownMenuField(
                  controller: TextEditingController(),
                  fieldLabel: 'Size',
                  dropDownLabel: 'Select Size',
                  dropdownEntries: const [
                    
                    
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),

               DropdownMenuField(
                  controller: TextEditingController(),
                  fieldLabel: 'Colour',
                  dropDownLabel: 'Select Colour',
                  dropdownEntries: const [
                    DropdownMenuEntry(value: 'Red', label: 'Red'),
                    DropdownMenuEntry(value: 'Green', label: 'Green'),
                    
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                DropdownMenuField(
                  controller: TextEditingController(),
                  fieldLabel: 'Box No',
                  dropDownLabel: 'Select Box No',
                  dropdownEntries: const [
                    DropdownMenuEntry(value: '15', label: 'Customer 15'),
                    DropdownMenuEntry(value: 'Customer 25', label: 'Customer 25'),
                    
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),

               DropdownMenuField(
                  controller: TextEditingController(),
                  fieldLabel: 'Texture',
                  dropDownLabel: 'Select Texture',
                  dropdownEntries: const [
                    
                  ],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                DynamicFieldRow(label: 'Req Qty', value: ''),
                hSpace(20),
                
                DynamicFieldRow(label: '2nd Conditioning', value: 'Yes or No'),
                hSpace(20),
                DynamicFieldRow(label: 'Send For Wefting', value: 'Yes or No'),
                
                
                
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
