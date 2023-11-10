import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class BoxInfoDisplay extends StatelessWidget {
  const BoxInfoDisplay({
    required this.boxNumber,
    required this.boxType,
    required this.boxSize,
    required this.boxWeight,
    super.key,
  });
  final String boxNumber;
  final String boxSize;
  final String boxType;
  final String boxWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.75)),
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(globalBorderRadius + 1),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(globalBorderRadius),
                topRight: Radius.circular(globalBorderRadius),
              ),
            ),
            child: const Row(
              children: [
                Text(
                  'Box Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(formFieldBorderRadius),
                bottomRight: Radius.circular(formFieldBorderRadius),
              ),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  boxType,
                  style: infoTextSize,
                ),
                Text(
                  '$boxSize"',
                  style: infoTextSize,
                ),
                Text(
                  '$boxWeight KG',
                  style: infoTextSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const infoTextSize = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
