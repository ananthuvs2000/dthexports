import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double borderRad = globalBorderRadius;

class OpenImageButton extends StatelessWidget {
  const OpenImageButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
    this.width,
  });
  final void Function()? onTap;
  final String label;
  final IconData icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.indigo,
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRad),
      child: Ink(
        height: 100.h,
        width: width,
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRad),
          color: Colors.grey.shade800,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            hSpace(5),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
