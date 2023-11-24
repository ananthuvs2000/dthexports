import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class WorkEntryTable extends StatelessWidget {
  const WorkEntryTable({
    super.key,
    required this.workersList,
    required this.totalPercentWastage,
  });

  final String totalPercentWastage;

  final List<Workerdatum> workersList;

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
                Text(
                  '$totalPercentWastage%',
                  style: _widgetTitleStyle,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: Text(
                    'Name',
                    style: _widgetSubTitleStyle,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Qty Used',
                    style: _widgetSubTitleStyle,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Output',
                    style: _widgetSubTitleStyle,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    '% Waste',
                    style: _widgetSubTitleStyle,
                  ),
                ),
              ],
            ),
          ),
          hSpace(5),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return _productionWorkEntry();
            },
          ),
        ],
      ),
    );
  }
}

Widget _productionWorkEntry() {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(globalBorderRadius / 2),
      color: Colors.black.withOpacity(0.05),
    ),
    child: Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            'Worker Name',
            style: _entryLabelStyle,
          ),
        ),
        Flexible(
          flex: 2,
          child: _workEntryTextField(),
        ),
        Flexible(
          flex: 2,
          child: _workEntryTextField(),
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
  fontSize: 13,
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

Widget _workEntryTextField() {
  return TextFormField(
    validator: (value) {
      if (value == null || value == '') {
        return 'Invalid';
      }
    },
    autovalidateMode: AutovalidateMode.onUserInteraction,
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
