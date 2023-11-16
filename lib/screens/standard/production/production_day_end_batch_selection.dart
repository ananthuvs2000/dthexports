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

class ProductionDayEndBatchSelectionPage extends StatelessWidget {
  const ProductionDayEndBatchSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().toIso8601String());
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
            FutureBuilder(
              future: DayStartFilterByDateService().fetchData(
                DateFormat('yyyy-MM-dd').format(DateTime.now()),
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final itemChecks = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: itemChecks.length,
                      itemBuilder: (context, index) {
                        final item = itemChecks[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: BatchSelectionTile(
                            batchCode: item.batchCode,
                            vendorCode: item.boxno,
                            quantityChecked: item.weightShown,
                            status: item.process,
                            onTap: () => Get.to(
                              () => DayEndScreen(
                                batchCode: item.batchCode,
                              ),
                              transition: Transition.rightToLeft,
                              preventDuplicates: true,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Column(
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                } else {
                  return const ErrorDisplayCaption(message: 'Could not fetch any batches');
                }
              },
            ),
            hSpace(10),
          ],
        ),
      ),
    );
  }
}
