import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/material.dart';

class BatchSelectionPage extends StatelessWidget {
  const BatchSelectionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Select Batch',
              style: TextStyles.veryLargeHeading,
            ),
            // Batch list builder
            ListView(),
          ],
        ),
      ),
    );
  }
}
