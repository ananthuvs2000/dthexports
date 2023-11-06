import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/spacer.dart';
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
    return Row(
      children: [
        Text(
          widget.label,
          style: TextStyles.dynamicFieldLabelStyle,
        ),
        wSpace(95),
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            onTap: widget.onTap,
            //
            readOnly: true,
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
                borderRadius: BorderRadius.all(
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

              //
              hintText: ' Date Range',
              errorStyle: const TextStyle(color: formFieldErrorColor),
              suffixIcon: const Icon(
                Icons.date_range,
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
      ],
    );
  }
}
