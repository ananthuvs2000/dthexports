import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/material.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    required this.label,
    required this.controller,
    required this.onTap,
    super.key,
  });
  final TextEditingController controller;
  final void Function() onTap;
  final String label;

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            widget.label,
            style: TextStyles.dynamicFieldLabelStyle,
          ),
        ),
        Flexible(
          flex: 2,
          child: TextFormField(
            controller: widget.controller,
            onTap: widget.onTap,
            readOnly: true,
            style: const TextStyle(),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.5),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(formFieldBorderRadius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(formFieldBorderRadius),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(formFieldBorderRadius),
                ),
                borderSide: BorderSide(
                  color: formFieldErrorColor,
                ),
              ),
              hintText: 'Date Range',
              hintStyle: const TextStyle(fontSize: 14),
              errorStyle: const TextStyle(color: formFieldErrorColor),
              suffixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.date_range),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            ),
          ),
        ),
      ],
    );
  }
}
