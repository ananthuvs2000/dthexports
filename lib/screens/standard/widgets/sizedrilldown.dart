import 'package:flutter/material.dart';

class SizeDropdownWidget extends StatefulWidget {
   SizeDropdownWidget({super.key});
   

  @override
  State<SizeDropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<SizeDropdownWidget> {
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
                    child: Text('20'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('25'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('30'),
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