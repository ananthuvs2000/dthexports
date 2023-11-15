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
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          gradient: subDashboardOptionGrad,
          borderRadius: BorderRadius.circular(globalBorderRadius),
          boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(-3, 3)
            )
          ]
          ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        focusColor: primaryColor.withOpacity(0.25),
        splashColor: primaryColor,
        hoverColor: primaryColor,
        selectedTileColor: primaryColor,
        selectedColor: primaryColor,
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

const TextStyle _batchCodeStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
  color: inversePrimaryColor
);
 TextStyle _subtitleStyle = TextStyle(
  fontWeight: FontWeight.w500,
  height: 0,
  fontSize: 13,
  color: Colors.white.withOpacity(.75)
);
const TextStyle _trailingStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 10,
  color: inversePrimaryColor

);
