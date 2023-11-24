import 'dart:convert';
import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorkerDataService extends ChangeNotifier {
  //! API ENDPOINT
  final String _employeeAPI = '$apiHOME/worker';

  Future<List<WorkerData>> fetchEmployees() async {
    final response = await http.get(Uri.parse(_employeeAPI));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      // Mapping to a Dart Model
      return jsonData
          .map(
            (item) => WorkerData(
              // id: int.parse(item['id'].toString()),
              name: item['employee_name'],
              empCode: item['employee_code'],
              createdAt: DateTime.parse(item['created_at']),
              // updatedAt: DateTime.parse(item['updated_at']),
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to fetch employees');
    }
  }
}
