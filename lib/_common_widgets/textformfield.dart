import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

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
  late FocusNode focusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedContainer(
          height: 50,
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(globalBorderRadius),
            boxShadow: focusNode.hasFocus
                ? [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.25),
                      blurRadius: 10,
                    )
                  ]
                : null,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          validator: (value) => widget.validator(value),
          obscureText: widget.isPassword ?? false,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          expands: false,
          focusNode: focusNode,
          // Styles
          style: const TextStyle(
            fontSize: 15,
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
              horizontal: 10,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }
}
