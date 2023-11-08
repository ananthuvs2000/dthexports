import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customcontainer extends StatelessWidget {
  const Customcontainer({Key? key, required this.text, required this.colors}) : super(key: key);
  final String text;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: colors),
        height: 100.h,
        width: 400.w,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
