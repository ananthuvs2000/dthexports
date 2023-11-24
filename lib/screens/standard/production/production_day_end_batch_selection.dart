import 'package:dth/_common_widgets/drop_down_menu_field.dart';
import 'package:dth/_providers/production_dayend_provider.dart';
import 'package:dth/_services/production_day_end_service.dart';
import 'package:dth/screens/standard/incoming/widgets/batch_selection_tile.dart';
import 'package:dth/screens/standard/production/production_day_end.dart';
import 'package:dth/theme/arrow_back.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/_common_widgets/error_display_caption.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductionDayEndBatchSelectionPage extends StatefulWidget {
  const ProductionDayEndBatchSelectionPage({super.key});

  @override
  State<ProductionDayEndBatchSelectionPage> createState() =>
      _ProductionDayEndBatchSelectionPageState();
}

class _ProductionDayEndBatchSelectionPageState extends State<ProductionDayEndBatchSelectionPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final batchProvider = Provider.of<ProductionDayEndProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        leadingWidth: 75,
        leading: ArrowBack(
          onTap: () => Get.back(),
        ),
        actions: [
          //! Show all existing dates of submitted batches from daystart
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 300,
            child: DropdownMenuField(
                fieldLabel: '',
                dropDownLabel: 'Choose a date',
                defaultValue: '2023-11-24',
                dropdownEntries: [
                  //!
                  DropdownMenuItem(value: '2023-11-23', child: Text('2023-11-23')),
                  DropdownMenuItem(value: '2023-11-24', child: Text('2023-11-24')),
                ],
                onSelected: (selected) {
                  //! API call to fetch batch codes of that date
                  batchProvider.fetchBatchCodes(selected);
                },
                validator: (value) {
                  return null;
                }),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hSpace(25),
            Text(
              'Select batch',
              style: TextStyles.veryLargeHeading,
            ),
            hSpace(10),
            // Batch list builder
            Consumer<ProductionDayEndProvider>(
              builder: (context, state, _) => Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.dayEndBatchCodes.length,
                  itemBuilder: (context, index) {
                    final item = state.dayEndBatchCodes[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: BatchSelectionTile(
                        batchCode: item['batch_code'],
                        vendorCode: 'item.boxno',
                        quantityChecked: 'item.weightShown',
                        status: 'item.process',
                        onTap: () => Get.to(
                          () => DayEndScreen(
                            batchCode: item['batch_code'],
                          ),
                          transition: Transition.rightToLeft,
                          preventDuplicates: true,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            hSpace(10),
          ],
        ),
      ),
    );
  }
}
