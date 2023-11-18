import 'package:dth/_common_widgets/textformfield.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDataTable extends StatefulWidget {
  const CustomDataTable({Key? key}) : super(key: key);

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:  EdgeInsets.all(8),
        child: DataTable(
      
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(globalBorderRadius)        
          ),
          dataTextStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),
          dataRowHeight: 60,
          columnSpacing:10,
          headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
          dataRowColor: MaterialStateColor.resolveWith((states) => Colors.black12),
          columns: [
            DataColumn(
              label: Text('WORKER', style: TextStyle(color: AppColors.inversePrimaryColor)),
            ),
            DataColumn(
              label: Text('QTY USED', style: TextStyle(color: AppColors.inversePrimaryColor)),
            ),
            DataColumn(
              label: Text('OUTPUT', style: TextStyle(color: AppColors.inversePrimaryColor)),
            ),
            DataColumn(
              label: Text('% WASTAGE', style: TextStyle(color: AppColors.inversePrimaryColor)),
            ),
          ],
          rows: List.generate(
            3,
            (index) => DataRow(
              cells: [
                DataCell(
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Worker 1',),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child:  CustomTextFormField(
              
              
              prefixIcon: null,
              keyboardType: TextInputType.number,
              hint: '',
              textAlign: TextAlign.center,
              controller: TextEditingController(),
              validator: (p0) {
                
              },      
            ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextFormField(
              
              
              prefixIcon: null,
              keyboardType: TextInputType.number,
              hint: '',
              textAlign: TextAlign.center,
              controller: TextEditingController(),
              validator: (p0) {
                
              },      
            ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextFormField(
              
              
              prefixIcon: null,
              keyboardType: TextInputType.number,
              hint: '   ',
              textAlign: TextAlign.center,
              controller: TextEditingController(),
              validator: (p0) {
                
              },      
            ),
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
