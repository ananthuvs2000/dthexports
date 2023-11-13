import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({
    required this.onPressed,
    required this.label,
    super.key,
  });
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.5),
            blurRadius: 3,
          )
        ],
        borderRadius: BorderRadius.circular(globalBorderRadius),
        gradient: primaryButtonGradient,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(globalBorderRadius - 1),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
