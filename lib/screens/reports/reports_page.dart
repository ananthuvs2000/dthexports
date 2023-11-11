import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/appbar_underline.dart';
import 'package:dth/_common_widgets/date_range_picker_field.dart';
import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        bottom: appBarUnderline,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    hSpace(15),
                    DropdownMenuField(
                      validator: (value) {
                        return '';
                      },
                      fieldLabel: 'Category',
                      dropDownLabel: 'Select Category',
                      dropdownEntries: const [
                        DropdownMenuItem(value: '1', child: Text('1')),
                        DropdownMenuItem(value: '2', child: Text('2')),
                        DropdownMenuItem(value: '3', child: Text('3')),
                      ],
                      onSelected: (selectedVal) {},
                    ),
                    hSpace(15),
                    DateRangePicker(
                      label: 'Period',
                      controller: TextEditingController(),
                      onTap: () {
                        showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2030),
                          lastDate: DateTime(2100),
                        );
                      },
                    ),

                    // Criterea
                    hSpace(15),
                    DropdownMenuField(
                      validator: (value) {
                        return '';
                      },
                      fieldLabel: 'Standard',
                      dropDownLabel: 'Select Type',
                      dropdownEntries: const [
                        DropdownMenuItem(value: 'BATCH_WISE', child: Text('BATCH_WISE')),
                        DropdownMenuItem(value: 'DATE_WISE', child: Text('DATE_WISE')),
                        DropdownMenuItem(value: 'MONTH_WISE', child: Text('MONTH_WISE')),
                        DropdownMenuItem(value: 'SIZE_WISE', child: Text('SIZE_WISE')),
                        DropdownMenuItem(value: 'BOX_NO_WISE', child: Text('BOX_NO_WISE')),
                        DropdownMenuItem(value: 'STAGE_WISE', child: Text('STAGE_WISE')),
                        DropdownMenuItem(value: 'EMPLOYEE_WISE', child: Text('EMPLOYEE_WISE')),
                      ],
                      onSelected: (selectedVal) {
                        print(selectedVal.toString());
                      },
                    ),
                    hSpace(15),
                    DropdownMenuField(
                      validator: (value) {
                        return '';
                      },
                      fieldLabel: 'Size',
                      dropDownLabel: 'Select Size',
                      dropdownEntries: const [
                        DropdownMenuItem(value: '10"-14"', child: Text('10"-14"')),
                        DropdownMenuItem(value: '15"-18"', child: Text('15"-18"')),
                        DropdownMenuItem(value: '19"-22"', child: Text('19"-22"')),
                        DropdownMenuItem(value: '23"-26"', child: Text('23"-26"')),
                        DropdownMenuItem(value: '27"-30"', child: Text('27"-30"')),
                        DropdownMenuItem(value: '31"-34"', child: Text('31"-34"')),
                        DropdownMenuItem(value: '35"_AND_ABOVE', child: Text('35" And Above')),
                      ],
                      onSelected: (selectedVal) {
                        print(selectedVal.toString());
                      },
                    ),
                    hSpace(15),

                    DropdownMenuField(
                      validator: (value) {
                        return '';
                      },
                      fieldLabel: 'Color',
                      dropDownLabel: 'Select Color',
                      dropdownEntries: const [
                        DropdownMenuItem(value: 'BLACK', child: Text('Black')),
                        DropdownMenuItem(value: 'GREY', child: Text('Grey')),
                        DropdownMenuItem(value: 'DYE', child: Text('Dye')),
                      ],
                      onSelected: (selectedVal) {
                        print(selectedVal.toString());
                      },
                    ),
                    hSpace(15),

                    DropdownMenuField(
                      validator: (value) {
                        return '';
                      },
                      fieldLabel: 'Texture',
                      dropDownLabel: 'Select Texture',
                      dropdownEntries: const [
                        DropdownMenuItem(value: 'STRAIGHT/WAVY', child: Text('STRAIGHT/WAVY')),
                        DropdownMenuItem(value: 'CURLY', child: Text('CURLY')),
                        DropdownMenuItem(value: 'SUPER STRAIGHT', child: Text('SUPER STRAIGHT')),
                      ],
                      onSelected: (selectedVal) {
                        print(selectedVal.toString());
                      },
                    ),
                    // End of listview
                  ],
                ),
              ),
              //
              hSpace(10),
              SizedBox(
                width: double.infinity,
                child: PrimaryElevatedButton(
                  onPressed: () {},
                  label: 'Generate',
                ),
              ),
              hSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
