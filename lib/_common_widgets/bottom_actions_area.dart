import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class BottomActionsArea extends StatelessWidget {
  const BottomActionsArea({
    required this.children,
    super.key,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: PageLayout.pagePaddingX,
        vertical: 7,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
