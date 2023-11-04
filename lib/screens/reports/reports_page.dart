import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
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
            child: ListView(
              shrinkWrap: true,
              children: [
                hSpace(15),
                DropdownMenuField(
                  fieldLabel: 'Category:',
                  dropDownLabel: 'Select Category',
                  dropdownEntries: [],
                  onSelected: (selectedVal) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
