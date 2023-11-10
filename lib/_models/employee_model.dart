// from quicktype
// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  int id;
  String employeeName;
  String employeeCode;

  Employee({
    required this.id,
    required this.employeeName,
    required this.employeeCode,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeCode: json["employee_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_code": employeeCode,
      };
}
