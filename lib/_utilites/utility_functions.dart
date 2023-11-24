import 'package:dth/_models/production_daystart_model.dart';

String hashEmployeeIdsIntoString(final Set<WorkerData> employees) {
  if (employees.isEmpty) {
    throw Exception('cant generate hash');
  } else {
    String temp = '';
    for (final id in employees) {
      temp += '${id.empCode}#';
    }
    return temp;
  }
}
