import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  BoxContainer({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300,
        ),
        height: 80,
        width: 150,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
