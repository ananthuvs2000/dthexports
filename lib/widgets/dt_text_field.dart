import 'package:flutter/material.dart';

class DthTextField extends StatefulWidget {
  const DthTextField({
    required this.controller,
    required this.validator,
    super.key,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;

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
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(formFieldBorderRadius)),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

const double formFieldBorderRadius = 10;
