import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.icon,
    required this.text,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.isPassword,
    super.key,
  });

  final TextInputType? keyboardType;
  final bool? isPassword;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      obscureText: isPassword ?? false,
      keyboardType: keyboardType ?? TextInputType.text,

      //
      style: const TextStyle(
        fontSize: 15,
        letterSpacing: 0,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.15),
          ),
          borderRadius: BorderRadius.circular(globalBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(globalBorderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(globalBorderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: formFieldErrorColor),
          borderRadius: BorderRadius.circular(globalBorderRadius),
        ),
        prefixIcon: icon,
        label: Text(text),
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 15,
          letterSpacing: 0,
        ),
        fillColor: Colors.black.withOpacity(0.05),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
      ),
    );
  }
}
