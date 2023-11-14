import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 5),
        child: CircleAvatar(
          backgroundColor: primaryColor.withOpacity(0.25),
          foregroundColor: primaryColor.withOpacity(0.5),
          radius: 30,
          child: const Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
    );
  }
}
