import 'package:flutter/material.dart';

class TeamDropdownWidget extends StatefulWidget {
   TeamDropdownWidget({super.key});
   

  @override
  State<TeamDropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<TeamDropdownWidget> {
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
         hint: Text('Select Worker/Staff',style: TextStyle(fontSize: 18),),
            value: valueChoose,
          items: [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('Staff1'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Staff2'),
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