import 'package:flutter/material.dart';

class BoxDropdownWidget extends StatefulWidget {
   BoxDropdownWidget({super.key});
   

  @override
  State<BoxDropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<BoxDropdownWidget> {
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
                    child: Text('1'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('2'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('3'),
                  ),
                  DropdownMenuItem(
                    value: '4',
                    child: Text('4'),
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