import 'package:flutter/material.dart';

class BatchSelectionTile extends StatelessWidget {
  const BatchSelectionTile({
    required this.batchCode,
    required this.vendorCode,
    required this.quantityChecked,
    required this.onTap,
    super.key,
  });
  final String batchCode;
  final String vendorCode;
  final String quantityChecked;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: Text(batchCode),
    );
  }
}
