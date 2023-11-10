import 'package:dth/_models/employee_model.dart';

String hashEmployeeIdsIntoString(final Set<Employee> employees) {
  if (employees.isEmpty) {
    throw Exception('cant generate hash');
  } else {
    String temp = '';
    for (final id in employees) {
      temp += '${id.employeeCode}#';
    }
    return temp;
  }
}
