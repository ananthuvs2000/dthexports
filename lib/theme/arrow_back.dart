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
    return Container(
      margin: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.5),
            blurRadius: 7,
            offset: const Offset(-2, 1),
          )
        ],
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.inversePrimaryColor,
          radius: 35,
          child: const Icon(
            FontAwesomeIcons.arrowLeft,
            size: 20,
          ),
        ),
      ),
    );
  }
}
