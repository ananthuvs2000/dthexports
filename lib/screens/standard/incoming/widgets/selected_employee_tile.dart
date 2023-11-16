import 'package:dth/_models/employee_model.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SelecteEmployeeTile extends StatelessWidget {
  const SelecteEmployeeTile({
    required this.employee,
    super.key,
    required this.onDelete,
  });
  final Employee employee;
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
              employee.employeeName,
              style: _titleStyle,
            ),
            subtitle: Text(
              employee.employeeCode,
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
