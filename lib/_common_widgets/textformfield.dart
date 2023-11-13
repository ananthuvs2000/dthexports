import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CustomTextFormField extends StatefulWidget {
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
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => widget.validator(value),
      obscureText: widget.isPassword ?? false,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      expands: false,
      focusNode: _focusNode,
      // Styles
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.15),
          ),
          borderRadius: BorderRadius.circular(globalBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
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
        prefixIcon: widget.icon,
        hintText: widget.text,
        helperStyle: TextStyle(
          color: Colors.black.withOpacity(0.25),
          fontSize: 15,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        fillColor: inversePrimaryColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
  }
}
