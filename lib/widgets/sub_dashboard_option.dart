import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubDashboardItem extends StatelessWidget {
  const SubDashboardItem({
    required this.onTap,
    required this.label,
    super.key,
  });

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(dashboardItemBorderRadius),
      child: Ink(
        width: 200,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.25),
          ),
          borderRadius: BorderRadius.circular(dashboardItemBorderRadius),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
