import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    required this.controller,
    required this.onTap,
    super.key,
  });
  final TextEditingController controller;
  final void Function() onTap;

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Period:',
          style: TextStyles.dynamicFieldLabelStyle,
        ),
        wSpace(90),
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            onTap: widget.onTap,
            //
            readOnly: true,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
                borderSide: BorderSide(
                  color: formFieldErrorColor,
                ),
              ),

              //
              hintText: ' Date Range',
              errorStyle: TextStyle(color: formFieldErrorColor),
              suffixIcon: Icon(
                Icons.date_range,
              ),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
      ],
    );
  }
}
