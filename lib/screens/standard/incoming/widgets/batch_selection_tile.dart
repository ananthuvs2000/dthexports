import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class BatchSelectionTile extends StatelessWidget {
  const BatchSelectionTile({
    required this.batchCode,
    required this.vendorCode,
    required this.quantityChecked,
    required this.status,
    required this.onTap,
    super.key,
  });
  final String batchCode;
  final String vendorCode;
  final String status;
  final String quantityChecked;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          gradient: AppGradients.subDashboardOptionGrad,
          borderRadius: BorderRadius.circular(globalBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(-2, 2),
            )
          ]),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        focusColor: AppColors.primaryColor.withOpacity(0.25),
        splashColor: AppColors.primaryColor,
        hoverColor: AppColors.primaryColor,
        selectedTileColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        isThreeLine: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(globalBorderRadius)),
        onTap: onTap,
        title: Text(
          batchCode,
          style: _batchCodeStyle,
        ),
        subtitle: Text(
          'Quantity: $quantityChecked\nVendor : $vendorCode',
          style: _subtitleStyle,
        ),
        trailing: Text(
          status.toUpperCase(),
          textAlign: TextAlign.center,
          style: _trailingStyle,
        ),
        titleAlignment: ListTileTitleAlignment.center,
      ),
    );
  }
}

TextStyle _batchCodeStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
  color: AppColors.inversePrimaryColor,
);
TextStyle _subtitleStyle = TextStyle(
  fontWeight: FontWeight.w500,
  height: 0,
  fontSize: 13,
  color: Colors.white.withOpacity(.75),
);
TextStyle _trailingStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 10,
  color: AppColors.inversePrimaryColor,
);
