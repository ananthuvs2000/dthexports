import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SelectedWorkerTile extends StatelessWidget {
  const SelectedWorkerTile({
    required this.worker,
    super.key,
    required this.onDelete,
  });
  final WorkerData worker;
  final void Function(BuildContext context) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => onDelete(context),
              borderRadius: BorderRadius.circular(globalBorderRadius),
              icon: CupertinoIcons.trash_fill,
              backgroundColor: AppColors.formFieldErrorColor,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.25),
                  blurRadius: 7,
                  offset: const Offset(-2, 2),
                )
              ],
              borderRadius: BorderRadius.circular(globalBorderRadius),
              gradient: AppGradients.subDashboardOptionGrad),
          child: ListTile(
            minVerticalPadding: 0,
            // tileColor: AppColors.primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(globalBorderRadius)),
            ),

            title: Text(
              worker.name,
              style: _titleStyle,
            ),
            subtitle: Text(
              worker.empCode,
              style: _subtitleStyle,
            ),
            // trailing: IconButton(
            //     onPressed: () => {},
            //     icon: const Icon(
            //       CupertinoIcons.trash_fill,
            //       color: Colors.white,
            //       size: 20,
            //     )),
          ),
        ),
      ),
    );
  }
}

const _titleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 16,
  letterSpacing: 0,
);

final _subtitleStyle = TextStyle(
  fontSize: 14,
  color: Colors.white.withOpacity(0.75),
);
