import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardOptionContainer extends StatelessWidget {
  const DashboardOptionContainer({
    required this.icon,
    required this.text,
    required this.onTap,
    required this.color,
    super.key,
  });

  final IconData icon;
  final String text;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(globalBorderRadius),
      child: Ink(
        width: 250.w,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(globalBorderRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            wSpace(15),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
