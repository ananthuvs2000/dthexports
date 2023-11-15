import 'package:dth/theme/colors.dart';

import 'package:flutter/material.dart';

class CustomSwitchTile extends StatefulWidget {
  CustomSwitchTile({
    required this.title,
    super.key,
    required this.onChanged, required this.value,
  });
  final bool value;
  final String title;
  final void Function(bool value) onChanged;

  @override
  State<CustomSwitchTile> createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        inactiveThumbColor: Colors.black54,
        activeColor: AppColors.primaryColor,
        
        title: Text(
          '${widget.title}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
            fontSize: 15,
          ),
        ),
        value: widget.value,
        onChanged: (value) => widget.onChanged(value),
      ),
    );
  }
}
