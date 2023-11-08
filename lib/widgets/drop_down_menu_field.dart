import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: DropdownMenu(
            width: 200.w,
            enableSearch: false,
            enableFilter: false,
            controller: widget.controller,
            label: Text(
              widget.dropDownLabel,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            textStyle: const TextStyle(
              fontSize: 14,
            ),
            dropdownMenuEntries: widget.dropdownEntries,
            initialSelection: widget.defaultValue,
            onSelected: (value) => widget.onSelected(value),
          ),
        ),
      ],
    );
  }
}
