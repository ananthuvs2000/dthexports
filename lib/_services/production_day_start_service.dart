import 'dart:convert';

import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductionDayStartService extends ChangeNotifier {
  Future<ProductionDayStartData> fetchDayStartData(String batchCode) async {
    const apiUrl = '$apiHOME/accepted_batch_details';
    final requestBody = {'batch_code': batchCode};

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final ProductionDayStartData result = productionDayStartDataFromJson(response.body);
        return result;
      } else {
        // Handle errors here
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      throw Exception('Error: $error');
    }
  }

  Future<bool> postToProductionDayStart({
    required String batchCode,
    required String boxNum,
    required String team,
    required String process,
    required String imageURL,
    required String weightShown,
    required String calculatedWeight,
  }) async {
    const dayStartPostUri = '$apiHOME/daystart_entry';
    final dayStartrequestBody = {
      'batch_code': batchCode,
      'box_no': boxNum,
      'process': process,
      'team': team,
      'image': imageURL,
      'weight_shown': weightShown,
      'calculated_weight': calculatedWeight,
    };
    try {
      final response = await http.post(
        Uri.parse(dayStartPostUri),
        body: json.encode(dayStartrequestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        // Handle errors here
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      throw Exception('Error: $error');
    }
  }
}
