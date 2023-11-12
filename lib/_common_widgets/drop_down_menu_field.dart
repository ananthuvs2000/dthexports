import 'package:dth/theme/app_theme.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

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
          child: DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            enableFeedback: true,
            isExpanded: true,
            borderRadius: BorderRadius.circular(globalBorderRadius),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
            focusColor: primaryColor,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 1,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: mainFont,
              color: Colors.black,
            ),

            autovalidateMode: AutovalidateMode.onUserInteraction,

            // Dropdown decoration
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 12,
                height: 1,
                fontFamily: mainFont,
                color: Colors.red,
              ),
              hoverColor: primaryColor,
              focusColor: primaryColor,
              isDense: true,
              alignLabelWithHint: false,
              floatingLabelAlignment: FloatingLabelAlignment.center,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(globalBorderRadius),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(globalBorderRadius),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(globalBorderRadius),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(globalBorderRadius),
                borderSide: BorderSide(
                  width: 1,
                  color: primaryColor,
                ),
              ),
              hintStyle: const TextStyle(fontSize: 12),
              labelStyle: const TextStyle(fontSize: 12),
            ),
            hint: Text(
              dropDownLabel,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            iconSize: 25,
            items: dropdownEntries,
            validator: (value) => validator(value),
            onChanged: (value) => onSelected(value),
            value: defaultValue,
          ),
        ),
      ],
    );
  }
}
