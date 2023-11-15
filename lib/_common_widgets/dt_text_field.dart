import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DthTextField extends StatefulWidget {
  const DthTextField({
    required this.controller,
    required this.validator,
    this.hintText,
    this.inputFormatters,
    super.key,
  });
  final List<TextInputFormatter>? inputFormatters;
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
      inputFormatters: widget.inputFormatters,
      //? DECORATION
      decoration: InputDecoration(
        labelText: widget.hintText ?? '',
        labelStyle: TextStyle(
          fontSize: 13,
          color: Colors.black.withOpacity(0.3),
        ),

        errorStyle: const TextStyle(
          fontSize: 13,
          letterSpacing: -0.25,
          color: Colors.red,
        ),
        //
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.formFieldEnabledBorderColor,
          ),
          borderRadius:  const BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius:  const BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.formFieldErrorColor),
          borderRadius: const BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.formFieldErrorColor),
          borderRadius: const BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );
  }
}
