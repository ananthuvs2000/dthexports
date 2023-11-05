import 'package:flutter/material.dart';

class DropdownMenuField extends StatefulWidget {
  const DropdownMenuField({
    required this.controller,
    required this.fieldLabel,
    required this.dropDownLabel,
    required this.dropdownEntries,
    required this.onSelected,
    this.defaultValue,
    this.menuWidth,
    super.key,
  });
  final TextEditingController controller;
  final double? menuWidth;
  final String fieldLabel;
  final String dropDownLabel;
  final String? defaultValue;
  final void Function(String) onSelected;
  final List<DropdownMenuEntry> dropdownEntries;

  @override
  State<DropdownMenuField> createState() => _DropdownMenuFieldState();
}

class _DropdownMenuFieldState extends State<DropdownMenuField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.fieldLabel,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        DropdownMenu(
          enableSearch: false,
          enableFilter: false,
          controller: widget.controller,
          width: widget.menuWidth ?? 200,
          label: Text(
            widget.dropDownLabel,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          dropdownMenuEntries: widget.dropdownEntries,
          initialSelection: widget.defaultValue,
          onSelected: (value) => widget.onSelected(value),
        ),
      ],
    );
  }
}
