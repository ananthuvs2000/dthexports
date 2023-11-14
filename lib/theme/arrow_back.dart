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
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.4),
              blurRadius: 5,
            )
          ],
        ),
        child: CircleAvatar(
          backgroundColor: primaryColor,
          foregroundColor: inversePrimaryColor,
          radius: 35,
          child: const Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
    );
  }
}
