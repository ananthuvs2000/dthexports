import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/DateRangePickerField.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
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
                        fieldLabel: 'Category:',
                        dropDownLabel: 'Select Category',
                        dropdownEntries: const [],
                        onSelected: (selectedVal) {},
                      ),
                      hSpace(15),
                      DateRangePicker(
                        controller: TextEditingController(),
                        onTap: () {
                          showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2030),
                            lastDate: DateTime(2040),
                          );
                        },
                      ),

                      // Criterea
                      hSpace(15),
                      DropdownMenuField(
                        controller: TextEditingController(),
                        fieldLabel: 'Standard',
                        dropDownLabel: 'Select Type',
                        dropdownEntries: const [
                          DropdownMenuEntry(value: 'BATCH_WISE', label: 'Batch Wise'),
                          DropdownMenuEntry(value: 'DATE_WISE', label: 'Date Wise'),
                          DropdownMenuEntry(value: 'MONTH_WISE', label: 'Month Wise'),
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
