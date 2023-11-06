import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/date_range_picker_field.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Report'),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 1),
            child: Container(
              color: Colors.black.withOpacity(0.25),
              height: 1,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
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
                        controller: TextEditingController(),
                        fieldLabel: 'CATEGORY',
                        dropDownLabel: 'Select Category',
                        dropdownEntries: const [],
                        onSelected: (selectedVal) {},
                      ),
                      hSpace(15),
                      DateRangePicker(
                        label: 'PERIOD',
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
                        controller: TextEditingController(),
                        fieldLabel: 'STANDARD',
                        dropDownLabel: 'Select Type',
                        dropdownEntries: const [
                          DropdownMenuEntry(value: 'BATCH_WISE', label: 'Batch Wise'),
                          DropdownMenuEntry(value: 'DATE_WISE', label: 'Date Wise'),
                          DropdownMenuEntry(value: 'MONTH_WISE', label: 'Month Wise'),
                          DropdownMenuEntry(value: 'SIZE_WISE', label: 'Size Wise'),
                          DropdownMenuEntry(value: 'BOX_NO_WISE', label: 'Box No. Wise'),
                          DropdownMenuEntry(value: 'STAGE_WISE', label: 'Stage Wise'),
                          DropdownMenuEntry(value: 'EMPLOYEE_WISE', label: 'Employee Wise'),
                        ],
                        onSelected: (selectedVal) {
                          print(selectedVal.toString());
                        },
                      ),
                      hSpace(15),
                      DropdownMenuField(
                        controller: TextEditingController(),
                        fieldLabel: 'SIZE',
                        dropDownLabel: 'Select Size',
                        dropdownEntries: const [
                          DropdownMenuEntry(value: '10"-14"', label: '10"-14"'),
                          DropdownMenuEntry(value: '15"-18"', label: '15"-18"'),
                          DropdownMenuEntry(value: '19"-22"', label: '19"-22"'),
                          DropdownMenuEntry(value: '23"-26"', label: '23"-26"'),
                          DropdownMenuEntry(value: '27"-30"', label: '27"-30"'),
                          DropdownMenuEntry(value: '31"-34"', label: '31"-34"'),
                          DropdownMenuEntry(value: '35"_AND_ABOVE', label: '35" And Above'),
                        ],
                        onSelected: (selectedVal) {
                          print(selectedVal.toString());
                        },
                      ),
                      hSpace(15),

                      DropdownMenuField(
                        controller: TextEditingController(),
                        fieldLabel: 'COLOR',
                        dropDownLabel: 'Select Color',
                        dropdownEntries: const [
                          DropdownMenuEntry(value: 'BLACK', label: 'Black'),
                          DropdownMenuEntry(value: 'GREY', label: 'Grey'),
                          DropdownMenuEntry(value: 'DYE', label: 'Dye'),
                        ],
                        onSelected: (selectedVal) {
                          print(selectedVal.toString());
                        },
                      ),
                      hSpace(15),

                      DropdownMenuField(
                        controller: TextEditingController(),
                        fieldLabel: 'TEXTURE',
                        dropDownLabel: 'Select Texture',
                        dropdownEntries: const [
                          DropdownMenuEntry(value: 'STRAIGHT/WAVY', label: 'STRAIGHT/WAVY'),
                          DropdownMenuEntry(value: 'CURLY', label: 'CURLY'),
                          DropdownMenuEntry(value: 'SUPER STRAIGHT', label: 'SUPER STRAIGHT'),
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
      ),
    );
  }
}
