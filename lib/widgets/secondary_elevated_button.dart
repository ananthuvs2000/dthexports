import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';

class SecondaryElevatedButton extends StatelessWidget {
  const SecondaryElevatedButton({
    required this.onPressed,
    required this.label,
    super.key,
  });
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: theme.primary,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          color: theme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
