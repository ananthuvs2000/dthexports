import 'package:flutter/material.dart';

class CustomeDropDown extends StatefulWidget {
   CustomeDropDown({super.key});
   

  @override
  State<CustomeDropDown> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<CustomeDropDown> {
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
         hint: Text('-Select Customer-',style: TextStyle(fontSize: 18),),
            value: valueChoose,
          items: [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('Customer 1'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Customer 2'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('Customer 3'),
                  ),
                  DropdownMenuItem(
                    value: '4',
                    child: Text('Customer 4'),
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