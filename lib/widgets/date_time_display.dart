import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class DateTimeDisplay extends StatefulWidget {
  const DateTimeDisplay({
    super.key,
    required this.date,
    required this.time,
  });

  final String date;
  final String time;

  @override
  State<DateTimeDisplay> createState() => _DateTimeDisplayState();
}

class _DateTimeDisplayState extends State<DateTimeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(
            Icons.watch_later_outlined,
            color: primaryColor,
          ),
          wSpace(10),
          // DateTimeText
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.date,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              wSpace(10),
              Text(
                widget.time,
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
