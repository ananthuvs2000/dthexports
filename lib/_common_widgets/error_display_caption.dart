import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorDisplayCaption extends StatefulWidget {
  const ErrorDisplayCaption({
    super.key,
    required this.message,
  });

  final String message;

  @override
  State<ErrorDisplayCaption> createState() => _ErrorDisplayCaptionState();
}

class _ErrorDisplayCaptionState extends State<ErrorDisplayCaption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        color: AppColors.formFieldErrorColor,
        borderRadius: BorderRadius.circular(globalBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Icon(
            Icons.error,
            color: AppColors.inversePrimaryColor,
          ),
          wSpace(5),
          // DateTimeText
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.message,
                style: TextStyle(
                  color: AppColors.inversePrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
