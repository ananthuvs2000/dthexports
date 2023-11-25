import 'package:dth/_common_widgets/error_display_caption.dart';
import 'package:dth/_providers/itemcheck_provider.dart';
import 'package:dth/screens/standard/incoming/widgets/batch_selection_tile.dart';
import 'package:dth/screens/standard/production/production_day_start.dart';
import 'package:dth/theme/arrow_back.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AccepedBatchSelectionPage extends StatelessWidget {
  const AccepedBatchSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ItemCheckProvider>(context).fetchAcceptedChecks();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
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
            Text(
              'Select batch',
              style: TextStyles.veryLargeHeading,
            ),
            hSpace(10),
            // Batch list builder
            Consumer<ItemCheckProvider>(
              builder: (context, state, child) => (state.acceptedChecks.isNotEmpty)
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.acceptedChecks.length,
                      itemBuilder: (context, index) {
                        final item = state.acceptedChecks[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: BatchSelectionTile(
                            batchCode: item.batchCode,
                            vendorCode: item.vendoCode,
                            quantityChecked: item.quantityChecked,
                            status: item.status,
                            onTap: () => Get.to(
                              () => DayStart(
                                batchCode: item.batchCode,
                              ),
                              transition: Transition.rightToLeft,
                              preventDuplicates: true,
                            ),
                          ),
                        );
                      },
                    )
                  : const ErrorDisplayCaption(message: 'No batches available'),
            ),
            hSpace(10),
          ],
        ),
      ),
    );
  }
}
