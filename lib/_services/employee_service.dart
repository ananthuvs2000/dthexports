import 'dart:convert';

import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeDataService extends ChangeNotifier {
  //! API ENDPOINT
  final String _employeeAPI = '$apiHOME/worker';

  Future<List<Employee>> fetchEmployees() async {
    final response = await http.get(Uri.parse(_employeeAPI));
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      // Mapping to a Dart Model
      return jsonData
          .map(
            (item) => Employee(
              id: int.parse(item['id'].toString()),
              employeeName: item['employee_name'],
              employeeCode: item['employee_code'],
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to fetch employees');
    }
  }
}
