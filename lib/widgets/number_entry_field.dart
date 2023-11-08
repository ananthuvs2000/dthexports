import 'package:dth/widgets/dt_text_field.dart';
import 'package:flutter/material.dart';

class NumberEntryField extends StatelessWidget {
  const NumberEntryField({
    required this.label,
    required this.controller,
    required this.validator,
    super.key,
  });
  final String label;
  final TextEditingController controller;
  final String Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.max,
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            maxLines: 2,
          ),
        ),
        Flexible(
          flex: 2,
          child: DthTextField(
            hintText: 'XX.XX KG',
            controller: controller,
            validator: (value) => validator(value),
          ),
        ),
      ],
    );
  }
}
