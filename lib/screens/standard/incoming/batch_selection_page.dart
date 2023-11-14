import 'package:dth/_providers/itemcheck_provider.dart';
import 'package:dth/screens/standard/incoming/accept_page.dart';
import 'package:dth/screens/standard/incoming/widgets/batch_selection_tile.dart';
import 'package:dth/theme/arrow_back.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/_common_widgets/error_display_caption.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BatchSelectionPage extends StatelessWidget {
  const BatchSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: ArrowBack(
          onTap: () => Get.back(),
        ),
        toolbarHeight: 60,
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
            Consumer<ItemCheckProvider>(
              builder: (context, state, child) => FutureBuilder(
                future: state.getItemChecks(),
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

                          return BatchSelectionTile(
                            batchCode: item.batchCode,
                            vendorCode: item.vendoCode,
                            quantityChecked: item.quantityChecked,
                            status: item.status,
                            onTap: () => Get.to(
                              () => AcceptPage(batchCode: item.batchCode),
                              transition: Transition.rightToLeft,
                              preventDuplicates: true,
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const ErrorDisplayCaption(message: 'Could not fetch any batches');
                  }
                },
              ),
            ),
            hSpace(10),
          ],
        ),
      ),
    );
  }
}
