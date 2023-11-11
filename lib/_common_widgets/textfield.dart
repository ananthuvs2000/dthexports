import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightEntryField extends StatefulWidget {
  const WeightEntryField({super.key});

  @override
  State<WeightEntryField> createState() => _WeightEntryFieldState();
}

class _WeightEntryFieldState extends State<WeightEntryField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 30.h,
      width: 60.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.transparent),
      ),
      child: const Center(
        child: TextField(
          textAlign: TextAlign.center,
          // controller: _quantityController,
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),

          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
