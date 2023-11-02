import 'package:flutter/material.dart';

class ColorDropdownWidget extends StatefulWidget {
   ColorDropdownWidget({super.key});
   

  @override
  State<ColorDropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<ColorDropdownWidget> {
  String? valueChoose;
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6)
        ),
        
        child: DropdownButton(
         hint: Text('-SELECT-',style: TextStyle(fontSize: 18),),
            value: valueChoose,
          items: [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('RED'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('GREEN'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('BLUE'),
                  ),
               
                ],
                onChanged: (newValue) {
                  setState(() {
                    valueChoose=newValue;
                  });
                },),
      ),
    );
  }
}