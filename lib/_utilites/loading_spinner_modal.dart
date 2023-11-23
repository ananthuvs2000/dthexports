import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';

Future showLoadingSpinnerModal(BuildContext context, [String message = 'Loading']) async {
  return showDialog(
    context: context,
    builder: (context) => Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
        strokeWidth: 5,
      ),
    ),
  );
}
