import 'package:flutter/material.dart';

class BuildTextformField extends StatelessWidget {
  const BuildTextformField({
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

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: icon,
        hintText: text,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
        fillColor: Colors.black.withOpacity(0.08),
        filled: true,
      ),
    );
  }
}
