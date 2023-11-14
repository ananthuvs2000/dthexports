import 'package:dth/theme/app_theme.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({
    super.key,
    required this.dropDownLabel,
    required this.dropdownEntries,
    required this.validator,
    required this.onSelected,
    required this.defaultValue,
  });

  final String dropDownLabel;
  final List<DropdownMenuItem> dropdownEntries;
  final String? Function(dynamic value) validator;
  final void Function(String p1) onSelected;
  final String? defaultValue;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  late FocusNode focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: Duration.zero,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(globalBorderRadius),
            boxShadow: (focusNode.hasFocus)
                ? [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.25),
                      blurRadius: 10,
                    )
                  ]
                : null,
          ),
        ),
        DropdownButtonFormField(
          focusNode: focusNode,
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
            filled: true,
            fillColor: inversePrimaryColor,
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
                color: Colors.black.withOpacity(0.25),
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
            widget.dropDownLabel,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          iconSize: 25,
          items: widget.dropdownEntries,
          validator: (value) => widget.validator(value),
          onChanged: (value) => widget.onSelected(value),
          value: widget.defaultValue,
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }
}
