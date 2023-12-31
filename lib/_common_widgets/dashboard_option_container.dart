import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:flutter/material.dart';

class DashboardOptionContainer extends StatelessWidget {
  const DashboardOptionContainer({
    required this.icon,
    required this.text,
    required this.onTap,
    required this.shadowColor,
    super.key,
    required this.gradient,
  });

  final IconData icon;
  final String text;
  final Color shadowColor;
  final LinearGradient gradient;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(globalBorderRadius),
      child: Ink(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.5),
              offset: const Offset(-2, 2),
              blurRadius: 10,
            ),
          ],
          gradient: gradient,
          borderRadius: BorderRadius.circular(globalBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            hSpace(5),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
