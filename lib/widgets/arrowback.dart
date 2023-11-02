import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(180),
          color: Colors.black26,
        ),
        child: Center(
            child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        )),
      ),
    );
  }
}
