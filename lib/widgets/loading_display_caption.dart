import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/spacer.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.25),
        border: Border.all(color: primaryColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(formFieldBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          CircularProgressIndicator(
            color: primaryColor,
            strokeWidth: 2,
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
