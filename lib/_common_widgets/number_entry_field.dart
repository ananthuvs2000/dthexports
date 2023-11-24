import 'package:dth/_common_widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberEntryField extends StatelessWidget {
  const NumberEntryField({
    required this.label,
    required this.controller,
    required this.validator,
    this.onChanged,
    this.inputFormatter,
    super.key,
  });
  final String label;
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final void Function(String value)? onChanged;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.max,
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              height: 0,
            ),
            maxLines: 2,
          ),
        ),
        Flexible(
          flex: 2,
          child: CustomTextFormField(
            inputFormatter: inputFormatter,
            onChanged: (onChanged != null) ? (value) => onChanged!(value!) : null,
            prefixIcon: null,
            keyboardType: TextInputType.number,
            hint: 'XX.XX KG',
            textAlign: TextAlign.center,
            controller: controller,
            validator: (value) => validator(value),
          ),
        ),
      ],
    );
  }
}
