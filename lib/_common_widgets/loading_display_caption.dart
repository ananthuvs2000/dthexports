import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';

class LoadingDisplayCaption extends StatefulWidget {
  const LoadingDisplayCaption({
    super.key,
    required this.message,
  });

  final String message;

  @override
  State<LoadingDisplayCaption> createState() => _LoadingDisplayCaptionState();
}

class _LoadingDisplayCaptionState extends State<LoadingDisplayCaption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(globalBorderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2.5),
          ),
          wSpace(10),
          // DateTimeText
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.message,
                style: TextStyle(
                  color: primaryColor,
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
