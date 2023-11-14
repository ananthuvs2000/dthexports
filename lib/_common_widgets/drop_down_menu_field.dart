import 'package:flutter/material.dart';

import 'custom_dropdown_menu.dart';

class DropdownMenuField extends StatelessWidget {
  const DropdownMenuField({
    required this.fieldLabel,
    required this.dropDownLabel,
    required this.dropdownEntries,
    required this.onSelected,
    this.defaultValue,
    super.key,
    required this.validator,
  });
  final String fieldLabel;
  final String dropDownLabel;
  final String? defaultValue;
  final void Function(String) onSelected;
  final List<DropdownMenuItem> dropdownEntries;
  final String? Function(dynamic value) validator;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            fieldLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            maxLines: 2,
          ),
        ),
        Flexible(
          flex: 3,
          child: CustomDropdownMenu(
            dropDownLabel: dropDownLabel,
            dropdownEntries: dropdownEntries,
            validator: validator,
            onSelected: onSelected,
            defaultValue: defaultValue,
          ),
        ),
      ],
    );
  }
}
