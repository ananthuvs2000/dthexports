import 'package:flutter/material.dart';

class Customcontainer extends StatelessWidget {
   Customcontainer({Key? key,required this.text,required this.colors}):super(key: key);
  String text;
  Color colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colors
        ),
        height: 100,
        width: 400,
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),)),
    
      ),
    );
  }
}