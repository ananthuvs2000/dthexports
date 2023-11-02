import 'package:flutter/material.dart';

class VendorDropdownWidget extends StatefulWidget {
   VendorDropdownWidget({super.key});
   

  @override
  State<VendorDropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<VendorDropdownWidget> {
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
         hint: Text('Select VENDOR CODE',style: TextStyle(fontSize: 18),),
            value: valueChoose,
          items: [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('VC123'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('VC220'),
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