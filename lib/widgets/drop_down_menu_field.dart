import 'package:flutter/material.dart';

class DropdownMenuField extends StatefulWidget {
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
  final String Function(String? value) validator;

  @override
  State<DropdownMenuField> createState() => _DropdownMenuFieldState();
}

class _DropdownMenuFieldState extends State<DropdownMenuField> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            widget.fieldLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            maxLines: 2,
          ),
        ),
        Flexible(
          flex: 3,
          child: DropdownButtonFormField(
            isExpanded: true,
            isDense: true,
            hint: Text(
              widget.dropDownLabel,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            items: widget.dropdownEntries,
            validator: (value) => widget.validator(value),
            onChanged: (value) => widget.onSelected(value),
          ),
        ),
      ],
    );
  }
}
