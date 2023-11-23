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
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: ArrowBack(
          onTap: () => Get.back(),
        ),
        toolbarHeight: 60,
        leadingWidth: 70,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hSpace(15),
                Text(
                  'Select batch',
                  style: TextStyles.veryLargeHeading,
                ),
                Text('All batches undergone checking will be listed here.'),
                hSpace(15),
              ],
            ),
          ),
          // Batch list builder
          Consumer<ItemCheckProvider>(
            builder: (context, state, child) => Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX - 5),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.itemCheckStream.length,
                itemBuilder: (context, index) {
                  final item = state.itemCheckStream[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: BatchSelectionTile(
                      batchCode: item.batchCode,
                      vendorCode: item.vendoCode,
                      quantityChecked: item.quantityChecked,
                      status: item.status,
                      onTap: () => Get.to(
                        () => AcceptPage(batchCode: item.batchCode),
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
    );
  }
}
