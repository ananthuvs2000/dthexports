import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class WorkerProductionJobEntryTable extends StatelessWidget {
  const WorkerProductionJobEntryTable({
    super.key,
    required this.workersList,
  });

  final List<Workerdatum> workersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(globalBorderRadius),
            color: AppColors.primaryColor,
          ),
          child: const Row(
            children: [
              Text('data'),
            ],
          ),
        ),
      ],
    );
  }
}
