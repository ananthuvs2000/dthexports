import 'package:flutter/material.dart';

class DropdownMenuField extends StatefulWidget {
  const DropdownMenuField({
    required this.fieldLabel,
    required this.dropdownEntries,
    required this.onSelected,
    this.menuWidth,
    super.key,
  });
  final double? menuWidth;
  final String fieldLabel;
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
        const Text(
          'BOX NO.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        DropdownMenu(
          width: widget.menuWidth ?? 200,
          menuStyle: MenuStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.25),
                )),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          label: const Text('Select Boxes'),
          dropdownMenuEntries: widget.dropdownEntries,
          initialSelection: '',
          onSelected: (value) => widget.onSelected,
        ),
      ],
    );
  }
}
