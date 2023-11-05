import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 30,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.transparent)),
      child: const Center(
        child: TextField(
          textAlign: TextAlign.center,
          // controller: _quantityController,
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
