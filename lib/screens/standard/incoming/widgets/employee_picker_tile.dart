import 'package:dth/_models/employee_model.dart';
import 'package:dth/theme/colors.dart';
import 'package:flutter/material.dart';

class AddEmployeeTile extends StatelessWidget {
  const AddEmployeeTile({
    super.key,
    required this.emp,
    required this.onAdd,
  });

  final Employee emp;
  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(emp.employeeCode),
      title: Text(emp.employeeName),
      trailing: IconButton(
        splashRadius: 20,
        onPressed: onAdd,
        icon: Icon(
          Icons.add,
          size: 20,
          color: primaryColor,
        ),
      ),
    );
  }
}
