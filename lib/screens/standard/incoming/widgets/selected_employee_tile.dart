import 'package:dth/_models/employee_model.dart';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelecteEmployeeTile extends StatelessWidget {
  const SelecteEmployeeTile({
    required this.employee,
    super.key,
  });
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        minVerticalPadding: 0,
        tileColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        leading: CircleAvatar(
          radius: 35,
          child: Icon(
            CupertinoIcons.person_fill,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
        title: Text(
          employee.employeeName,
          style: _titleStyle,
        ),
        subtitle: Text(
          employee.employeeCode,
          style: _subtitleStyle,
        ),
        trailing: IconButton(
            onPressed: () => {},
            icon: const Icon(
              CupertinoIcons.trash_fill,
              color: Colors.white,
              size: 25,
            )),
      ),
    );
  }
}

const _titleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
  letterSpacing: 0,
);

final _subtitleStyle = TextStyle(
  color: Colors.white.withOpacity(0.75),
);
