import 'package:flutter/material.dart';

class DynamicFieldRow extends StatelessWidget {
  const DynamicFieldRow({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
            fontSize: 15,
          ),
        ),
        SelectableText(
          value,
          style: const TextStyle(
            letterSpacing: 0,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
