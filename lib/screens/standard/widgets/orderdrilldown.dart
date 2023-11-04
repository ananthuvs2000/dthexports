import 'package:flutter/material.dart';

class OrderDropdownWidget extends StatefulWidget {
   OrderDropdownWidget({super.key});
   

  @override
  State<OrderDropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<OrderDropdownWidget> {
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
                    child: Text('Order 1'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Order 2'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('Order 3'),
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