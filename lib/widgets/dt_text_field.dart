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

      //
      decoration: InputDecoration(
        hintText: widget.hintText ?? '',
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
        //
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

const double formFieldBorderRadius = 10;
