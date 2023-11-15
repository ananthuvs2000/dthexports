import 'package:dth/_common_widgets/textformfield.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/material.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    required this.label,
    required this.controller,
    required this.onTap,
    this.validator,
    super.key,
  });
  final TextEditingController controller;
  final void Function() onTap;
  final String label;
  final String? Function(String?)? validator;

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
          child: CustomTextFormField(
            onTap: widget.onTap,
            hint: 'Period',
            controller: widget.controller,
            isReadOnly: true,
            suffixIcon: const Icon(Icons.calendar_month),
            textAlign: TextAlign.center,
            validator: (value) => widget.validator!(value),
          ),
        ),
      ],
    );
  }
}
