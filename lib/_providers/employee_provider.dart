import 'package:dth/_models/employee_model.dart';
import 'package:dth/_services/employee_service.dart';
import 'package:flutter/material.dart';

class EmployeeProvider with ChangeNotifier {
  List<Employee> _employees = [];

  // Fetching all employees
  Future<void> fetchEmployees() async {
    final dataProvider = EmployeeDataService();
    _employees = await dataProvider.fetchEmployees();
    notifyListeners();
  }

  List<Employee> get employees => _employees;

  // Add an employee
}
