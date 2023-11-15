import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class SecondaryElevatedButton extends StatelessWidget {
  const SecondaryElevatedButton({
    required this.onPressed,
    required this.label,
    this.icon,
    super.key,
  });
  final String label;
  final void Function() onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(globalBorderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.15),
            offset: const Offset(-2, 2),
            blurRadius: 5,
          )
        ],
      ),
      child: (icon == null)
          ? ElevatedButton(
              onPressed: onPressed,
              style: secondaryElevatedButtonTheme,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: theme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(
                icon!,
                size: 21,
              ),
              label: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: theme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: secondaryElevatedButtonTheme,
            ),
    );
  }
}

ButtonStyle secondaryElevatedButtonTheme = ElevatedButton.styleFrom(
  elevation: 0,
  shadowColor: Colors.transparent,
  backgroundColor: AppColors.inversePrimaryColor,
  foregroundColor: AppColors.primaryColor,
  shape: RoundedRectangleBorder(
    side: BorderSide(
      width: 1,
      color: AppColors.primaryColor,
    ),
    borderRadius: BorderRadius.circular(globalBorderRadius),
  ),
  padding: const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 12,
  ),
);
