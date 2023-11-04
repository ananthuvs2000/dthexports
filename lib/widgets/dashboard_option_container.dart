import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Ink(
        width: 250,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.25)),
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            wSpace(20),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: -0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
