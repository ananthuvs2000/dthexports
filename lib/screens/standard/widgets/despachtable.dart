import 'package:dth/widgets/headertext.dart';
import 'package:flutter/material.dart';

class DespachTableWidget extends StatefulWidget {
  const DespachTableWidget({super.key});

  @override
  State<DespachTableWidget> createState() => _DespachTableWidgetState();
}

class _DespachTableWidgetState extends State<DespachTableWidget> {
  final TextEditingController _quantityController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Center(
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
                        border: TableBorder.all(color: Colors.black54),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300
                            ),
                            children: [
                              TableCell(child: Padding(padding: EdgeInsets.all(8),
                              child: Text('WORKER',style: headerText(),),)),
                              TableCell(child: Padding(padding: EdgeInsets.all(8),
                              child: Text('COMPLETED QTY',style: headerText(),),)),
                               TableCell(child: Padding(padding: EdgeInsets.all(8),
                              child: Text('TOTAL QTY',style: headerText(),),)),
                              
                            ]
                            
                          ),
                          ...List.generate(3, (index) =>
                          TableRow(
                            
                            children: [
                              TableCell(child: Padding(padding: EdgeInsets.all(8),
                              child: Text('Worker '),)),
                              TableCell(child: Padding(padding: EdgeInsets.all(8),
                              child: Text('Completed Qty'),)),
                               TableCell(child: Padding(padding: EdgeInsets.all(8),
                              child: Container(padding: EdgeInsets.only(right: 10),
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.transparent)),
                      child: Center(
                        child: TextField(textAlign: TextAlign.center,
                          controller: _quantityController,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),)),
                             
                              
                            ]
                            
                          ), ),
                        ],
                      ),
      ),
    );
  }
}