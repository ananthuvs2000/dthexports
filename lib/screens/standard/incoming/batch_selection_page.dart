import 'package:dth/_models/item_check_model.dart';
import 'package:dth/_providers/itemcheck_provider.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/widgets/error_display_caption.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BatchSelectionPage extends StatelessWidget {
  const BatchSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = Provider.of<ItemCheckProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hSpace(25),
              Text(
                'Select batch',
                style: TextStyles.veryLargeHeading,
              ),
              hSpace(5),
              // Batch list builder
              FutureBuilder(
                future: stream.getItemChecks(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<ItemCheck> itemChecks = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: itemChecks.length,
                        itemBuilder: (context, index) {
                          final item = itemChecks[index];

                          if (item.status == 'pending') {
                            return ListTile(
                              title: Text(item.batchCode),
                            );
                          }
                          return const ErrorDisplayCaption(message: 'No Pending Batches');
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
              hSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
