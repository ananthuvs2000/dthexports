import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class OrderedItemsdisplay extends StatelessWidget {
  const OrderedItemsdisplay({
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
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(formFieldBorderRadius),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(formFieldBorderRadius),
                topRight: Radius.circular(formFieldBorderRadius),
              ),
            ),
            child: const Row(
              children: [
                Text(
                  'Ordered Items',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
  fontWeight: FontWeight.bold,
);
