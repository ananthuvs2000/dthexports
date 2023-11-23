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
  Widget build(BuildContext context) {
    Provider.of<ProductionDayEndProvider>(context)
        .fetchBatchCodes(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        leadingWidth: 60,
        leading: ArrowBack(
          onTap: () => Get.back(),
        ),
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
