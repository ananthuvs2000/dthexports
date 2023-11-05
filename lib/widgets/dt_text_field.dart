import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';

class DthTextField extends StatefulWidget {
  const DthTextField({
    required this.controller,
    required this.validator,
    this.hintText,
    super.key,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;
  final String? hintText;
  @override
  State<DthTextField> createState() => _DthTextFieldState();
}

class _DthTextFieldState extends State<DthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => widget.validator(value),

      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      //! INPUT FORMATTERS
      inputFormatters: const [],
      //? DECORATION
      decoration: InputDecoration(
        labelText: widget.hintText ?? '',
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.25),
        ),
        //
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: formFieldErrorColor),
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: formFieldErrorColor),
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}

const double formFieldBorderRadius = 10;
