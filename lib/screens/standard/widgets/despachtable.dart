import 'package:flutter/material.dart';

class DespachTableWidget extends StatefulWidget {
  const DespachTableWidget({super.key});

  @override
  State<DespachTableWidget> createState() => _DespachTableWidgetState();
}

class _DespachTableWidgetState extends State<DespachTableWidget> {
  final TextEditingController _quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(color: Colors.black54),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            const TableRow(decoration: BoxDecoration(color: Colors.indigo), children: [
              TableCell(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Worker',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
              TableCell(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Completed Qty',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
              TableCell(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Total Qty',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
            ]),
            ...List.generate(
              3,
              (index) => TableRow(children: [
                const TableCell(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Worker '),
                )),
                const TableCell(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Completed Qty'),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.transparent)),
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _quantityController,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                )),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
