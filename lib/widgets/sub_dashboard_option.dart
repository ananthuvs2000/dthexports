import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(dashboardItemBorderRadius + 10),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(dashboardItemBorderRadius + 10),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
