import 'package:dth/theme/colors.dart';
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
  final String Function(String?) validator;
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.25),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: formFieldErrorColor),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: icon,
        prefixIconColor: Colors.black.withOpacity(0.5),
        label: Text(text),
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        fillColor: Colors.black.withOpacity(0.1),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
      ),
    );
  }
}
