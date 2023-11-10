import 'package:dth/_models/employee_model.dart';

class TeamCreationProvider {
  String hashEmployeeIdsIntoString(final List<Employee> ids) {
    Set<Employee> setE = ids.toSet();
    if (setE.isEmpty) {
      throw Exception('cant generate hash');
    } else {
      String temp = '';
      for (final id in setE) {
        temp += '${id.employeeCode}#';
      }
      return temp;
    }
  }
}
