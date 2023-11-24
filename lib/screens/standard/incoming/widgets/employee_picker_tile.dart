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
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Text(
        worker.empCode,
        style: const TextStyle(fontSize: 12),
      ),
      title: Text(
        worker.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: IconButton(
        splashRadius: 18,
        onPressed: onAdd,
        icon: Icon(
          Icons.add,
          size: 20,
          color: AppColors.primaryColor,
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
    );
  }
}
