import 'package:dth/screens/standard/widgets/despachtable.dart';

import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/bottom_actions_area.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';

import 'package:dth/widgets/ordered_items_display.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/team_manager_list.dart';
import 'package:flutter/material.dart';

class DespachScreen extends StatefulWidget {
  const DespachScreen({super.key});

  @override
  State<DespachScreen> createState() => _DespachScreenState();
}

class _DespachScreenState extends State<DespachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Dispatch'),
        bottom: appBarUnderline,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
              shrinkWrap: true,
              children: [
                hSpace(10),
                DropdownMenuField(
                  validator: (value) {
                    return null;
                  },
                  fieldLabel: 'Order No',
                  dropDownLabel: 'Select Order No',
                  dropdownEntries: const [],
                  onSelected: (selectedVal) {
                    print(selectedVal.toString());
                  },
                ),
                hSpace(10),
                const DynamicFieldRow(label: 'Process', value: 'Threading/Wefting'),
                hSpace(20),
                const DynamicFieldRow(label: 'Box No', value: 'Display Box No'),
                const SizedBox(
                  height: 20,
                ),
                const OrderedItemsdisplay(
                    boxNumber: 'Box No', boxType: 'Type', boxSize: 'Size', boxWeight: 'Weight'),
                hSpace(10),
                TeamManagerWidget(
                  editable: true,
                  teamList: [
                    WorkerData(id: 10, name: 'Athul'),
                    WorkerData(id: 15, name: 'Amal'),
                  ],
                ),
                hSpace(10),
                const DespachTableWidget(),
              ],
            ),
          ),
          BottomActionsArea(
            children: [
              Expanded(
                child: PrimaryElevatedButton(
                  onPressed: () {},
                  label: 'Submit',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
