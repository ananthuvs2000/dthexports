import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatefulWidget {
   CustomSwitchTile({Key? key ,required this.title}):super(key: key);
  String title;

  @override
  State<CustomSwitchTile> createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  bool _isChanged=false;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(0),
      child: SwitchListTile(
        
        inactiveThumbColor: Colors.black54,
        activeColor: primaryColor,
        title: Text('${widget.title}',style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
              fontSize: 15,
            ),),
        value: _isChanged, onChanged:(bool value){
        setState(() {
          _isChanged=value;
        });
      } ),
    );
  }
}