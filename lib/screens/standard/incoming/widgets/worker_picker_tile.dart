import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';

class WorkerPickerTile extends StatelessWidget {
  const WorkerPickerTile({
    super.key,
    required this.worker,
    required this.onAdd,
  });

  final WorkerData worker;
  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      subtitle: Text(
        worker.empCode,
        style: const TextStyle(fontSize: 12, height: 1),
      ),
      minVerticalPadding: 0,
      title: Text(
        worker.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
      trailing: IconButton(
        splashRadius: 20,
        onPressed: onAdd,
        icon: Icon(
          Icons.add,
          size: 25,
          color: AppColors.primaryColor,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
    );
  }
}
