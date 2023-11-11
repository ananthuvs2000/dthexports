import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black54),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(decoration: BoxDecoration(color: primaryColor), children: const [
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'WORKER',
              style: TextStyle(color: inversePrimaryColor),
            ),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Text('QTY USED', style: TextStyle(color: inversePrimaryColor)),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Text('OUTPUT', style: TextStyle(color: inversePrimaryColor)),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Text('% WASTAGE', style: TextStyle(color: inversePrimaryColor)),
          ))
        ]),
        ...List.generate(
          5,
          (index) => const TableRow(children: [
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text('Worker 1'),
            )),
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text('--'),
            )),
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text('--'),
            )),
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text('--'),
            )),
          ]),
        ),
      ],
    );
  }
}
