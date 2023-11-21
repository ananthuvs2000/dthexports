import 'package:dth/_common_widgets/table_entry%20field.dart';
import 'package:dth/_common_widgets/textformfield.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDataTable extends StatefulWidget {
  CustomDataTable({Key? key}) : super(key: key);
  final TextEditingController usedController=TextEditingController();
  final TextEditingController outController=TextEditingController();
  final TextEditingController wastageController=TextEditingController();


  late int _usedController=int.parse(usedController.text);
  late int _outputController=int.parse(usedController.text);

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  void wastageCalculate(){
    setState(() {
     var _wastage=widget._usedController+widget._outputController;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: DataTable(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(globalBorderRadius)),
          dataTextStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          dataRowHeight: 60,
          columnSpacing: 10,
          horizontalMargin: 1,
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => AppColors.primaryColor),
          dataRowColor:
              MaterialStateColor.resolveWith((states) => Colors.black.withOpacity(.05)),
          columns: [
            DataColumn(
              label: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(' WORKER  ',
                    style: TextStyle(color: AppColors.inversePrimaryColor)),
              ),
            ),
            DataColumn(
              label: Text('  QTY USED  ',
                  style: TextStyle(color: AppColors.inversePrimaryColor)),
            ),
            DataColumn(
              label: Text('  OUTPUT  ',
                  style: TextStyle(color: AppColors.inversePrimaryColor)),
            ),
            DataColumn(
              label: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text('  WASTAGE  ',
                    style: TextStyle(color: AppColors.inversePrimaryColor)),
              ),
            ),
          ],
          rows: List.generate(
            3,
            (index) =>  DataRow(
              cells: [
                 DataCell(
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Worker 1',
                    ),
                  ),
                ),
                 DataCell(
                  TableNumberEntry(iController: widget.usedController),
                ),
                DataCell(
                  TableNumberEntry(iController: widget.outController),
                ),
                DataCell(
                  Container(alignment: Alignment.center,
                    height: 30,
                    width: 50,
                    child: Text('55'),
                  ),
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
