import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required this.hint,
    required this.controller,
    required this.validator,
    this.textAlign,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.isPassword,
    this.isReadOnly,
    this.onTap,
    this.onChanged,
    this.inputFormatter,
    super.key,
  });

  final TextInputType? keyboardType;
  final bool? isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String hint;
  final TextAlign? textAlign;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final bool? isReadOnly;
  final List<TextInputFormatter>? inputFormatter;

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
                      color: AppColors.primaryColor.withOpacity(0.2),
                      blurRadius: 7,
                    )
                  ]
                : null,
          ),
        ),
        TextFormField(
          // Events
          onTap: widget.onTap,
          onChanged: (widget.onChanged != null) ? (value) => widget.onChanged!(value) : null,
          inputFormatters: widget.inputFormatter,
          //
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isPassword ?? false,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          expands: false,
          textAlign: widget.textAlign ?? TextAlign.left,
          focusNode: focusNode,
          textInputAction: TextInputAction.done,

          readOnly: widget.isReadOnly ?? false,
          // Styles
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.25),
              ),
              borderRadius: BorderRadius.circular(globalBorderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(globalBorderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(globalBorderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.formFieldErrorColor),
              borderRadius: BorderRadius.circular(globalBorderRadius),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
            ),
            errorStyle: TextStyle(
              color: AppColors.formFieldErrorColor,
              fontSize: 12,
              letterSpacing: 0,
              height: 1.1,
            ),
            errorMaxLines: 2,
            filled: true,
            fillColor: AppColors.inversePrimaryColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
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
