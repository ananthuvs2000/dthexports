import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class SubDashboardItem extends StatelessWidget {
  const SubDashboardItem({
    required this.onTap,
    required this.label,
    required this.icon,
    super.key,
  });

  final String label;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(dashboardItemBorderRadius + 10),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 2.5,
            ),
          ],
          gradient: subDashboardOptionGrad,
          borderRadius: BorderRadius.circular(dashboardItemBorderRadius + 10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              hSpace(10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
