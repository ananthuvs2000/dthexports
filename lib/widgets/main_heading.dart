import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.mainHeadingStyle,
    );
  }
}
