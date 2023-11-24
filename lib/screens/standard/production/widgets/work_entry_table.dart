import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class WorkEntryTableDayEnd extends StatelessWidget {
  const WorkEntryTableDayEnd({
    super.key,
    required this.workersList,
    required this.totalWastage,
    required this.quantityControllers,
    required this.individualWastages,
    required this.outputControllers,
  });

  final double totalWastage;
  final List<double> individualWastages;

  final List<WorkerData> workersList;
  final List<TextEditingController> quantityControllers;
  final List<TextEditingController> outputControllers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(globalBorderRadius / 2)),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Material Wastage',
                  style: _widgetTitleStyle,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$totalWastage kg',
                      style: _widgetTitleStyle,
                    ),
                    wSpace(10),
                    Text(
                      '(${totalWastage * 2 / 100} %)',
                      style: _widgetTitleStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          hSpace(5),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.25),
              borderRadius: const BorderRadius.all(Radius.circular(globalBorderRadius / 2)),
            ),
            padding: const EdgeInsets.all(10),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    'Name',
                    style: _widgetSubTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Qty Used',
                    style: _widgetSubTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Output',
                    style: _widgetSubTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    '% Waste',
                    style: _widgetSubTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          hSpace(5),
          ListView.builder(
            shrinkWrap: true,
            itemCount: workersList.length,
            itemBuilder: (context, index) {
              final WorkerData worker = workersList[index];
              return _productionWorkEntry(
                worker.name,
                TextEditingController(),
                TextEditingController(),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _productionWorkEntry(
  String name,
  TextEditingController qtyController,
  TextEditingController outputController,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(globalBorderRadius / 2),
      color: Colors.black.withOpacity(0.05),
    ),
    child: Flex(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 4,
          child: Text(
            name,
            style: _entryLabelStyle,
          ),
        ),
        Flexible(
          flex: 2,
          child: _workEntryTextField(qtyController),
        ),
        Flexible(
          flex: 2,
          child: _workEntryTextField(outputController),
        ),
        const Flexible(
          flex: 2,
          child: Text(
            '% Waste',
            style: _entryLabelStyle,
          ),
        ),
      ],
    ),
  );
}

final _widgetTitleStyle = TextStyle(
  color: AppColors.inversePrimaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);
final _widgetSubTitleStyle = TextStyle(
  color: AppColors.primaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 13,
);
const _entryLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  height: 1.2,
  fontSize: 12,
  letterSpacing: 0,
);

Widget _workEntryTextField(
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value == null || value == '') {
        return 'Error';
      }
      return null;
    },
    expands: false,
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      errorStyle: TextStyle(
        color: AppColors.formFieldErrorColor,
        fontSize: 11,
        height: 1,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      isCollapsed: true,
      isDense: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.25)),
        borderRadius: BorderRadius.circular(globalBorderRadius / 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.25)),
        borderRadius: BorderRadius.circular(globalBorderRadius / 2),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.formFieldErrorColor),
        borderRadius: BorderRadius.circular(globalBorderRadius / 2),
      ),
    ),
  );
}
