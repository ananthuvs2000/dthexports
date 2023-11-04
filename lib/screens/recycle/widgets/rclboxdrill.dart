import 'package:flutter/material.dart';

class RecycleBoxDropdownWidget extends StatefulWidget {
   RecycleBoxDropdownWidget({super.key});
   

  @override
  State<RecycleBoxDropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<RecycleBoxDropdownWidget> {
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
                    child: Text('A'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('B'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('C'),
                  ),
                  DropdownMenuItem(
                    value: '4',
                    child: Text('D'),
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