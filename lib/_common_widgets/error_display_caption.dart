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
        color: formFieldErrorColor.withOpacity(0.25),
        border: Border.all(color: formFieldErrorColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(formFieldBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          const Icon(
            Icons.error,
            color: formFieldErrorColor,
          ),
          wSpace(10),
          // DateTimeText
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.message,
                style: const TextStyle(
                  color: formFieldErrorColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
