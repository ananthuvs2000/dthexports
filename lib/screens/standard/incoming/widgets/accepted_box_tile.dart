import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcceptedBoxTile extends StatelessWidget {
  const AcceptedBoxTile({
    required this.boxNum,
    required this.color,
    required this.texture,
    required this.quantityChecked,
    required this.onDelete,
    super.key,
    required this.size,
  });
  final String boxNum;
  final String color;
  final String size;
  final String texture;
  final String quantityChecked;

  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(globalBorderRadius),
          border: Border.all(
            color: Colors.black.withOpacity(0.25),
          )),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        focusColor: AppColors.primaryColor.withOpacity(0.25),
        splashColor: AppColors.primaryColor,
        hoverColor: AppColors.primaryColor,
        selectedTileColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(globalBorderRadius)),
        title: Text(
          'Box No. $boxNum',
          style: _batchCodeStyle,
        ),
        subtitle: Text(
          'Quantity: $quantityChecked Size: $size Color: $color',
          style: _subtitleStyle,
        ),
        trailing: IconButton(onPressed: onDelete, icon: const Icon(CupertinoIcons.clear)),
        titleAlignment: ListTileTitleAlignment.center,
      ),
    );
  }
}

const TextStyle _batchCodeStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
);
const TextStyle _subtitleStyle = TextStyle(
  fontWeight: FontWeight.normal,
  height: 0,
  fontSize: 13,
);
const TextStyle _trailingStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 10,
);
